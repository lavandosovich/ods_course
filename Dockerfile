FROM jupyter/datascience-notebook

RUN pip install fastai

RUN wget https://github.com/fastai/fastai/archive/master.zip
RUN mkdir fastai
RUN tar -cvf master.zip ./fastai
RUN ls ./fastai
RUN pip install nltk funcy matplotlib_venn gensim eli5
