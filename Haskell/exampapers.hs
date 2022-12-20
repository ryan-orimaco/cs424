--JAN 2020 
--Define a Haskell function crossMap which takes a binary function F and two lists XS and YS, and returns a list of the result of applying F
--to each possible pair of elements with the first taken from XS and the
--second from YS. (Order of elements in output is unspecified.) You
--should include a type signature.
--Example:
--Prelude> crossMap (-) [100,200,300] [4,3,2,1] [96,97,98,99,196,197,198,199,296,297,298,299]
--Prelude> crossMap (:) "123" ["abc","def"] ["1abc","1def","2abc","2def","3abc","3def"]
crossMap :: (a -> b -> c) -> [a] -> [b] -> [c]
crossMap f [] ys = []
crossMap f xs ys = concat (map (\x -> map (f x) ys)xs)

--Jan 2019 --
--Define scatterGather (see Q1) in Haskell, except that it takes an
--additional first argument which is the value to use when an index it out of range. Be sure to give a type signature.
--Examples: scatterGather '_' [0,1,4,1,1,7,2] "abcde" => "abebb_c"
--scatterGather 0 [0,1,4,1,1,7,2] [100,101,102] => [100,101,0,101,101,0,102]
scatterGather other indices values = map findIt indices
  where
    findIt k =
      if(k > length values || k < 0) then other else values !! k

--Autumn 2018 --
--Define a Haskell function mapSkip which takes a function and a list and returns the result of applying the given function to 
--every other element of the given list, starting with the first
--element. Be sure to include a type signature.
--Example: mapSkip (+1000) [1..6] => [1001,2,1003,4,1005,6]
mapSkip array fun n
    | null array = []
    | mod n 2 == 0 =  [fun (head array)] ++ mapSkip (tail array) fun ( n + 1)
    | otherwise = [(head array)] ++ mapSkip (tail array) fun ( n + 1)

--January 2018
--Define a Haskell function tear, including its type, which takes a predicate and a list and returns a list of two lists, the first
--those elements of the input list which pass the predicate, the second those that don't, in order.
--Examples: tear (>5) [1,10,2,12,3,13] => [[10,12,13],[1,2,3]]
tear cond list = [(filter cond list)] ++ [(filterNot cond list)]

filterNot cond list
    | null list = []
    | cond (head list) = filterNot cond (tail list)
    | otherwise = [(head list)] ++ filterNot cond (tail list)

--Autumn 2017 
--Define a Haskell function foo, including a type signature, that takes two lists and yields
--a list combining all the elements in the two input lists, taking 1 from the first list, 2 from
--the second list, 3 from the first list, 4 from the second list, etc,until both are exhausted.
--Examples:
--foo [1,2,3,4,5,6,7,8] [11,12,13,14,15,16,17,18]  => [1,11,12,2,3,4,13,14,15,16,5,6,7,8,17,18]

foo :: [Int] -> [Int] ->[Int]
foo x y = fooHelper x y 1

fooHelper :: [Int] -> [Int] -> Int -> [Int]
fooHelper [] [] a = []
fooHelper x y a
    | ((mod a 2) == 1) = take a x ++ fooHelper (drop a x)y (a+1)
    | ((mod a 2) == 0) = take a y ++ fooHelper x (drop a y) (a+1)