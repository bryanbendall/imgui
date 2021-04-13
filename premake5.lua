project "ImGui"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
		"imgui_tables.cpp",
		--"misc/freetype/imgui_freetype.cpp",
		--"misc/freetype/imgui_freetype.h"
		--"examples/libs/gl3w/GL/gl3w.h",
		--"examples/libs/gl3w/GL/gl3w.c",
		"misc/cpp/imgui_stdlib.cpp",
		"misc/cpp/imgui_stdlib.h",
		"backends/imgui_impl_glfw.cpp",
		"backends/imgui_impl_glfw.h",
		"backends/imgui_impl_opengl3.cpp",
		"backends/imgui_impl_opengl3.h",
	}

	includedirs
	{
		"%{prj.location}",
		"../../%{IncludeDir.GLFW}",
		"../../%{IncludeDir.Glad}",
		--"%{prj.location}/examples/libs/gl3w"
	}

	links
	{
        "GLFW",
		"Glad"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
