library(reticulate,lib.loc = "/usr/local/lib/R/site-library")

flask = import('flask')
app = flask$Flask('__main__')

index = function() {return('hello flask!')}
app$add_url_rule('/', view_func = index, options="GET")

app$run()
