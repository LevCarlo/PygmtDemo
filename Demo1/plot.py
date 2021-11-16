'''
Author: Mengjie Zheng
email: Zhengmengjie18@mails.ucas.ac.cn
Date: 2021-11-16 22:21:10
LastEditTime: 2021-11-16 23:03:15
LastEditors: Mengjie Zheng
Description: 
 # 绘制俯冲带地震分布
 # 参考：https://gmt-china.org/example/ex026/
FilePath: \PygmtDemo\Demo1\plot.py
'''

import os
import pygmt
from pygmt.src.config import config
import pandas as pd

# File path
root_path = os.path.dirname(os.path.realpath(__file__))
datadir = 'data'
figdir = 'fig'
FM = 'FMC.txt'
grd = 'eastchina_py.grd'
outfile = 'subduction_py.png'

# Plot settings
RMAP = [122, 149, 30, 48]
J = 'M12c'

# GMT settings
pygmt.config(MAP_FRAME_WIDTH='2p',
             MAP_FRAME_PEN='0.5p',
             FONT_ANNOT_PRIMARY='8p',
             FONT_LABEL='8p',
             MAP_TICK_LENGTH='0.1c')

pygmt.grdcut('@earth_relief_04m', outgrid=os.path.join(root_path, datadir, grd),
             region=RMAP)

fig = pygmt.Figure()
fig.grdimage(os.path.join(root_path, datadir, grd),
             region=RMAP, projection=J, cmap='globe',
             frame=["NWes", 'a'])
focal_mechanism = pd.read_csv(os.path.join(root_path, datadir, FM))
# fig.meca(focal_mechanism, scale="1c")
fig.show()
fig.savefig(os.path.join(root_path, figdir, outfile))