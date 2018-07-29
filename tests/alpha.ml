let%expect_test "alpha" =
  Test.run {|
    let x : int = 1
    in let x : int = 2 + x
      in let x : int = 3 + x
          in let g(x : int) : int = x + x
            in let h(x : int) : int = x + g(x)
                in g(h(g(x)))
                end
            end
          end
      end
    end
  |};
  
  [%expect {|
    72
    72
    72
    72
    (Int 72) |}]
