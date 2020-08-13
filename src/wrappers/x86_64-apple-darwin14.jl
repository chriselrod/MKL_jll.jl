# Autogenerated wrapper script for MKL_jll for x86_64-apple-darwin14
export libmkl_core, libmkl_rt

using IntelOpenMP_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "DYLD_FALLBACK_LIBRARY_PATH"
LIBPATH_default = "~/lib:/usr/local/lib:/lib:/usr/lib"

# Relative path to `libmkl_core`
const libmkl_core_splitpath = ["lib", "libmkl_core.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libmkl_core_path = ""

# libmkl_core-specific global declaration
# This will be filled out by __init__()
libmkl_core_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libmkl_core = "@rpath/libmkl_core.dylib"


# Relative path to `libmkl_rt`
const libmkl_rt_splitpath = ["lib", "libmkl_rt.dylib"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libmkl_rt_path = ""

# libmkl_rt-specific global declaration
# This will be filled out by __init__()
libmkl_rt_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libmkl_rt = "@rpath/libmkl_rt.dylib"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"MKL")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (IntelOpenMP_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (IntelOpenMP_jll.LIBPATH_list,))

    global libmkl_core_path = normpath(joinpath(artifact_dir, libmkl_core_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libmkl_core_handle = dlopen(libmkl_core_path)
    push!(LIBPATH_list, dirname(libmkl_core_path))

    global libmkl_rt_path = normpath(joinpath(artifact_dir, libmkl_rt_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libmkl_rt_handle = dlopen(libmkl_rt_path)
    push!(LIBPATH_list, dirname(libmkl_rt_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()

