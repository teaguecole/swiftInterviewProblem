import Foundation

public class InterviewProblems {
    
    // Time Complexity O(N^2)
    // Space Complexity O(N)
    public static func threeNumberSum(array: [Int], targetSum: Int) -> [[Int]] {
        let sorted = array.sorted()
        var triplets = [[Int]]()
        for i in 0...(sorted.count - 2) {
            var left = i + 1
            var right = sorted.count - 1
            while left < right {
                let currentSum = sorted[i] + sorted[left] + sorted[right]
                if currentSum == targetSum {
                    triplets.append([sorted[i], sorted[left], sorted[right]])
                    left += 1
                    right -= 1
                } else if currentSum < targetSum {
                    left += 1
                } else if currentSum > targetSum {
                    right -= 1
                }
            }
        }
        return triplets
    }
    
    // Time Complexity O(Nlog(N) + Mlog(M))
    // Space Complexity O(1)
    
    // Parameters passed in to swift functions are constant, inout allows them to mutated
    // within the function.  When you call the function, you need make a variable myVar, and
    // pass it in like &myVar
    public static func smallestDifference(arrayA: inout [Int], arrayB: inout [Int]) -> [Int] {
        arrayA.sort()
        arrayB.sort()
        
        var indexA = 0
        var indexB = 0
        
        var smallestDifference = Int.max
        var currentDifference = Int.max
        
        var smallestPair = [Int]()
        
        while indexA < arrayA.count && indexB < arrayB.count {

            // This is important! If you dont store firstNum and secondNum,
            // when you store smallestPair, one of numbers will be
            // off by an index since idxOne or idxTwo will have changed.
            // In other words, you can not use arrayOne[idxOne], and
            // arrayTwo[idxTwo] because those values change from the time
            // you compare to the time you update smallestPair or return
            let firstNum = arrayA[indexA]
            let secondNum = arrayB[indexB]
            
            if firstNum < secondNum {
                currentDifference = secondNum - firstNum
                indexA = indexA + 1
            } else if firstNum > secondNum {
                currentDifference =  firstNum - secondNum
                indexB = indexB + 1
            } else {
                return [firstNum, secondNum]
            }
            
            if smallestDifference > currentDifference {
                smallestDifference = currentDifference
                smallestPair = [firstNum, secondNum]
            }
        }
        return smallestPair
    }
}


