'''
Author: Mengjie Zheng
email: zhengmengjie18@mails.ucas.ac.cn
Date: 2021-11-25 21:36:09
LastEditTime: 2021-11-25 22:55:44
LastEditors: Mengjie Zheng
Description: 
FilePath: \CPT_Make\makecpt.py
'''

import sys
import os
import numpy as np
import pandas as pd

vmin, vmax = 2.8, 7.2
template_file = 'Berg.dat'
outfile = 'velocity1.cpt'
# print(sys.path[0])

root_path = sys.path[0]
indir = 'template'
outdir = 'cpt'

data = pd.read_csv(os.path.join(root_path, indir, template_file), sep=' ', header=None)

varray = np.linspace(vmin, vmax, data.shape[0], endpoint=True)

f = open(os.path.join(root_path, outdir, outfile), 'w')

f.write('%.2f %s %.2f %s\n' % (varray[0], data.iloc[0, 1],
                               varray[1], data.iloc[1, 1]))
for i in range(1, len(varray) -1):
    f.write('%.2f %s %.2f %s\n' % (varray[i], data.iloc[i, 1],
                                   varray[i+1], data.iloc[i+1, 1]))
# f.write('%.2f %s %.2f %s\n' % (varray[-2], data.iloc[-2, 1],
#                                varray[-1], data.iloc[-1, 1]))
f.write('B   black\n')
f.write('F   white\n')
f.write('N   128\n')