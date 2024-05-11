"""
Newton 法

### 引数
* f: 1変数関数
* df: `f` の微分
* x0: 初期値
* tol: 許容誤差
* max_iter: 最大反復回数

### 戻り値
* 近似解の履歴の配列

### 使用例
以下は `√2` の近似値を求める例．
```julia
newton(x -> x^2 - 2, x -> 2x, 1.0)[end]
```
"""
function newton(f, df, x0 :: Float64, tol = 1.0e-06, max_iter = 100) :: Vector{Float64}
  x = x0
  sq = [ x ]
  for i in 1:max_iter
    if abs(f(x)) < tol
      break
    end
    x = x - f(x) / df(x)
    push!(sq, x)
  end
  return sq
end
