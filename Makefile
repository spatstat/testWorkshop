LAB_RMD = $(wildcard labs/lab*.Rmd)
LAB_MD = $(patsubst %.Rmd, docs/%.md, $(LAB_RMD))
SOL_RMD = $(wildcard solutions/solution*.Rmd)
SOL_MD = $(patsubst %.Rmd, docs/%.md, $(SOL_RMD))

all: $(LAB_MD) $(SOL_MD)

docs/labs/lab%.md: labs/lab%.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = rmarkdown::github_document(html_preview = FALSE), output_dir = "docs/labs")'

docs/solutions/solution%.md: solutions/solution%.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = rmarkdown::github_document(html_preview = FALSE), output_dir = "docs/solutions")'

.PHONY: all clean
