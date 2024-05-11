### A Pluto.jl notebook ###
# v0.19.40

using Markdown
using InteractiveUtils

# ╔═╡ 63ac440f-c0ad-479c-bd54-3bf1b73325f6
using LinearAlgebra

# ╔═╡ da8b90d0-f3f9-11ee-267d-e1047d03090c
# ゼロになってほしい関数
function f(v)
	x, y, z = v
	return [
		x+2y+z+1.0
		x^2+2y^2+z^2-10.0
		sin(x + y + z)-0.7
	]
end

# ╔═╡ c2547d60-32fa-4f94-b468-ebd527af7517
# f の微分であるヤコビ行列
function J(v)
	x, y, z = v
	return [
		1 2 1
		2x 4y 2z
		cos(x+y+z) cos(x+y+z) cos(x+y+z)
	]
end

# ╔═╡ c520a46a-7436-46f3-abab-8ca72216d5d3
begin
	# Newton 法で近似する
	
	# 初期値
	x = [1.0, 0.0, 0.0]
	
	sq = x
	
	# 反復改善する
	for i in 1:100
		println("$i : $x, $(norm(f(x)))")
		if norm(f(x)) < 1.0e-06
			break
		end
		x = x - J(x) \ f(x)
		sq = hcat(sq, x)
	end
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.2"
manifest_format = "2.0"
project_hash = "ac1187e548c6ab173ac57d4e72da1620216bce54"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.0+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.23+4"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+1"
"""

# ╔═╡ Cell order:
# ╠═da8b90d0-f3f9-11ee-267d-e1047d03090c
# ╠═c2547d60-32fa-4f94-b468-ebd527af7517
# ╠═63ac440f-c0ad-479c-bd54-3bf1b73325f6
# ╠═c520a46a-7436-46f3-abab-8ca72216d5d3
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
