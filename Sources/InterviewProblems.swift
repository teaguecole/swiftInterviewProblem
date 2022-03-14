import Foundation

public class InterviewProblems {
    
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
    
    
}


