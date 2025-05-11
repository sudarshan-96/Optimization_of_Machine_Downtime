import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

def plot_correlations(df):
    corr = df.corr()
    sns.heatmap(corr, annot=True, cmap='coolwarm')
    plt.title('Feature Correlation Heatmap')
    plt.show()