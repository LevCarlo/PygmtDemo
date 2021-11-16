###
 # @Author: Mengjie Zheng
 # @email: Zhengmengjie18@mails.ucas.ac.cn
 # @Date: 2021-11-16 21:28:47
 # @LastEditTime: 2021-11-16 22:13:17
 # @LastEditors: Mengjie Zheng
 # @Description: 
 # 绘制俯冲带地震分布
 # 参考：https://gmt-china.org/example/ex026/
 # @FilePath: \PygmtDemo\Demo1\plot.sh
###


# File path
FM='./data/FMC.txt'
grd='./data/eastchina.grd'
outfile='./fig/subduction'
format='png'

# Plot settings
RMAP=122/149/30/48
J=M12c

# GMT settings
gmt set MAP_FRAME_WIDTH 2p
gmt set MAP_FRAME_PEN 0.5p
gmt set FONT_ANNOT_PRIMARY 8p
gmt set FONT_LABEL 8p
gmt set MAP_TICK_LENGTH 0.1c

## Preprocess
# 绘制地形图
gmt grdcut @earth_relief_04m -R$RMAP -G$grd
# 生成地震深度颜色表
echo 0 purple@30 70 purple@30 > 'cpt/depth.cpt'
echo 70 green@30 300 green@30 >> 'cpt/depth.cpt'
echo 300 red@30 800 red@30 >> 'cpt/depth.cpt'


## Plot
gmt begin $outfile $format
gmt grdimage $grd -R$RMAP -J$J -Ba -BNWes -Cglobe
gmt meca $FM -R$RMAP -J$J -Sm0.3c -Z'cpt/depth.cpt'

# 绘制测线AB
gmt plot -R$RMAP -J$J -W1p,black,-.- << EOF
126 42 A
146 40 B
EOF

# 绘制测线AB
gmt text -R$RMAP -J$J -F+f10p -Dx0c/0.2c << EOF
126 42 A
146 40 B
EOF


# 绘制图例
gmt legend -F+gazure1@10 -DjBL+w2.2i/1.6i+l1.2 -C0.1i/0.1i << EOF
H 10,0 Earthquake Location
L 6,0 C (2000-2010)
G 0.1c
L 8,0 C Magnitude(Mw)
G 0.1c
N 4
S 0.1i c 0.10i - black 0.2i 5
S 0.1i c 0.11i - black 0.2i 6
S 0.1i c 0.12i - black 0.2i 7
S 0.1i c 0.13i - black 0.2i 8
N 1
G 0.1c
L 8,0 C Depth(km)
G 0.1c
N 3
L 7,0 R @;purple;0-70km@;;
L 7,0 R @;green;70-300km@;;
L 7,0 R @;red;300-660km@;;
G 0.7c
B globe 0.3i 0.08i+ml -Bxa10000+l"Topo(m)" --FONT_ANNOT_PRIMARY=6p --MAP_FRAME_WIDTH=1p
EOF

gmt end

rm gmt*
