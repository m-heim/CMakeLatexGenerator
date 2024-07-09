# Copyright 2024 M. Heim

add_custom_target(latex_clean
latexmk -C
)

function(latex_add_document path)
    add_custom_target(deps
    DEPENDS assets bib)
    add_custom_target(${path}_move
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/${path}.tex ${CMAKE_CURRENT_BINARY_DIR}
    )
    add_custom_target(${path}_compile
    COMMAND latexmk -pdf ${CMAKE_CURRENT_BINARY_DIR}/${path}.tex
    DEPENDS ${path}_move deps)
    add_custom_target(${path}
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_BINARY_DIR}/${path}.pdf ${CMAKE_CURRENT_SOURCE_DIR}
    DEPENDS ${path}_compile)
endfunction()

function(latex_add_assets path)
    add_custom_target(assets
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/${path} ${CMAKE_CURRENT_BINARY_DIR}/${path}
    )
endfunction()

function(latex_add_bibliography path)
    add_custom_target(bib
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/${path} ${CMAKE_CURRENT_BINARY_DIR}
    )
endfunction()