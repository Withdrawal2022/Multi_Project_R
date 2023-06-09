下面由我来讲以下因子分析的结果以及对因子分析的记过进行聚类。

在做因子分析之前，我们先看一下原始变量的相关性，这里我们进行Barlett 检验，barlett检验是检验变量之间的协方差矩阵，和单位矩阵的差异，如果差异大于0，那么就可以进行因子分析，否则就不可以进行因子分析。

然后我们再来确定合适的K值，也就是因子个数，对协方差矩阵进行特征值分解，然后根据特征值的大小来确定K值，我们可以看到，基本上前四个特征值占了绝大多数，所以我们采取前四个特征值，也就是K=4。
从最后计算的累计贡献率也可以看出，四个因子可以解释90.5%的variance.

然后我们来解释这些因子，在解释之前我们需要先看这些因子是否能充分表达每个原始变量，这里我们用共性方差来检查这一点，我们可以看到每个原始变量的共性方差都接近于1，所以可以说明这些因子是足够充分的。然后从旋转后因子载荷矩阵可以分析出，第一个因子为国际化因子，第二个因子为名誉因子，第三个因子为教学因子，第四个因子为科研因子。

接下来重新计算了每一个学校的score，并且展示出排名波动比较小的学校，可以看到，排名波动比较小的学校，大多数都是前列的学校，这也说明了综合实力比较强的学校，在不同榜单上的排名波动相对比较小。

接下来是聚类分析，首先我们用手肘法确定聚类的数量，我们发现，当K大于5的时候，聚类的SSE下降速率相对较小，所以我们确定K=5。

然后我们先是对原始变量进行了一次聚类，然后把聚类中心的对应数值用雷达图展示出来，我们发现用原始变量聚类出来的结果并不容易解释，这是由于原始变量之间的相关性比较大，所以在不同变量的值可能也会有一定的相似性，这样就导致了结果较难解释。因此，我们再对因子值进行聚类，得出来的结果右图所示。

这样的结果相对来说更容易解释。我们可以看到第一组的学校，名誉因子和研究因子都很高，说明是研究强校，比如有UIUC，佐治亚理工这些学校以研究为名。第二组的学校，国际化因子比较高，搜索查了一下这些学校大多来自于英国和澳大利亚，可能较多的中国留学生。教学因子较低，说明教学氛围比较轻松。第三组的学校，整体上来说非常全面，基本都是前50的学校。第四组的学校，教学因子和研究因子都很强，但名誉较低，说明是新兴高校或者说是一些小众的强校，比如咱么学校就在这一组里。第五组的学校，名誉因子和教学因子较高，这些学校的教学很好，并且出去的学生质量很高，并且比较有意思的是第五组的学校主要来自于德国，德国的学校一般宽进严出，教学质量确实有口皆碑。

