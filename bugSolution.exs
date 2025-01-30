```elixir
list = [1, 2, 3, 4, 5]

try do
  Enum.each(list, fn x ->
    if x == 3 do
      throw(:error)
    end
    IO.puts(x)
  end)
catch
  :error -> IO.puts("Error encountered!")
end

#Alternative using Enum.reduce for better error handling
Enum.reduce(list, [], fn x, acc ->
  if x == 3 do
    {:error, acc}
  else
    [x | acc]
  end
end) |> case do
  {:error, acc} -> IO.puts("Error: #{acc}")
  acc -> Enum.each(acc, &IO.puts/1)
end
```