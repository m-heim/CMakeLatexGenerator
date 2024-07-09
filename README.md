# CMakeLatexGenerator
- Generate a build system for latex documents using CMake

## How to
- Include the latex.cmake in your project
- In the directory with the .tex file, .bib file and assets create a CMakeLists.txt that adds .tex files via latex_add_document, .bib files via latex_add_bibliography and asset directories via latex_add_assets
- Important: The name of the document should be given without extension, e.g. (text.tex -> test)
