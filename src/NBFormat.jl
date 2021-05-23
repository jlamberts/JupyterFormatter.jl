module NBFormat

using IJulia
using JuliaFormatter

function format_current_cell()
    current_cell = IJulia.In[IJulia.n]
    formatted = JuliaFormatter.format_text(current_cell)
    if formatted != current_cell
        IJulia.load_string(formatted, true)
    end
end

enable_autoformat() = IJulia.push_preexecute_hook(format_current_cell)
disable_autoformat() = IJulia.pop_preexecute_hook(format_current_cell)

export enable_autoformat, disable_autoformat
end
