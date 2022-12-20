import Data.List 
import System.IO

-- Lists are singly linked and can only add the front--
primeNumber = [3,5,7,11]
morePrime = primeNumber ++ [13,17,19,23,29] --Concat--
favNums = 2 : 7 : 21 : 66 : []
multilist = [[3,5,7],[11,13,17]]
morePrimes2 = 2 : morePrime
lenPrime = length morePrimes2
revPrime = reverse morePrimes2
secondPrime = morePrimes2 !! 1
firstPrime = head morePrimes2
lastPrime = last morePrimes2
first3Primes = take 3 morePrimes2
is7InList = 7 `elem` morePrimes2
listTimes2 = [x * 2 | x <- [1..10]]

--zipWith is used to combine Lists --
sumOfLists = zipWith (-) [100,200,300] [6,7,8,9,10]
evensUpTo20 = takeWhile (<=20) [2,4 ..]

--foldl applies operations on each element --
multOfList = foldr (*) 1[2,3,4,5]

--List's Comphrenehension --
multTable = [[y - x | y <- [100,200,300]] | x <- [1,2,3,4]]

--Tuples: Lists of multiple data types --
randTuple = (1, "Random Tuple")

--Functions --
addTuples ::(Int,Int) -> (Int,Int) -> (Int,Int)
addTuples (x,y) (x2,y2) = (x + x2, y+y2)

--Recursion --
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

--Gaurds --
batAvgRatin :: Double -> Double -> String
batAvgRatin hits atBats 
    | avg <= 0.200 = "Terrible"
    | avg <= 0.250 = "Your doing pretty good"
    | otherwise = "Superstar"
    where avg = hits /atBats

--Access List  Items --
getListItems :: [Int] -> String
getListItems [] = "Your List is empty"
getListItems (x:[]) = "Your list starts with " ++ show x
getListItems(x:y:[]) = "Your list contains " ++ show x ++ " and " ++ show y
getListItems (x:xs) = "The 1st item is " ++ show x ++ "and the rest" ++ show xs

--Higher Order functions --
times4 :: Int -> Int
times4 x = x * 4

listTimes4 = map times4 [1,2,3,4,5]

multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs

areStringEq :: [Char] -> [Char] -> Bool
areStringEq [] [] = True
areStringEq (x:xs) (y:ys) = x == y && areStringEq xs ys
areStringEq _ _ = False

--Passing a Function -- 
doMult :: (Int -> Int) -> Int
doMult func = func 3
num3Times4 = doMult times4

getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y
adds3 = getAddFunc 3
fourPlus3 = adds3 4