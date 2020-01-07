import numpy as np
import scipy as sp


def indian_pines(corrected=True):
    class_labels = {0: 'Empty', 1: 'Alfalfa', 2: 'Corn-notill', 3: 'Corn-mintill', 4: 'Corn', 5: 'Grass-pasture',
                    6: 'Grass-trees', 7: 'Grass-pasture-mowed', 8: 'Hay-windrowed', 9: 'Oats', 10: 'Soybean-notill',
                    11: 'Soybean-mintill', 12: 'Soybean-clean', 13: 'Wheat', 14: 'Woods',
                    15: 'Buildings-Grass-Trees-Drives', 16: 'Stone-Steel-Towers'}
