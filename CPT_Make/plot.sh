###
 # @Author: Mengjie Zheng
 # @email: zhengmengjie18@mails.ucas.ac.cn
 # @Date: 2021-11-25 15:19:08
 # @LastEditTime: 2021-11-25 22:56:18
 # @LastEditors: Mengjie Zheng
 # @Description: 
 # @FilePath: \CPT_Make\plot.sh
### 

#!/usr/bin/bash

gmt makecpt -Cglobe -T0/0.15/0.025 -Z > 'cpt/demo.cpt'

gmt begin fig/demo png,pdf
# gmt colorbar -C'cpt/demo.cpt' -Baf -Dx0/0+w4.5i/0.2i+h+e
gmt colorbar -C'cpt/Berg.cpt' -Baf -Dx0/0+w4.5i/0.2i+h+e -By+l"Berg"
gmt colorbar -C"cpt/velocity1.cpt" -Bxaf -Dx0/0+w4.5i/0.2i+h+e -Y-0.8i -By+l"Customized0"
gmt colorbar -C"cpt/Liwei.cpt" -Bxa5f1 -Dx0/0+w4.5i/0.2i+h+e -Y-0.8i -By+l"Liwei"
gmt colorbar -C"cpt/velocity.cpt" -Bxa0.4f0.1 -Dx0/0+w4.5i/0.2i+h+e -Y-0.8i -By+l"Customized1"
gmt end