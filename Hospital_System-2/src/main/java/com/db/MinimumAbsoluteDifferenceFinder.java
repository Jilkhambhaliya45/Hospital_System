import java.util.Collections;
import java.util.ArrayList;
import java.util.List;

public class MinimumAbsoluteDifferenceFinder {

    /**
     * Finds all pairs of elements with the minimum absolute difference, prints the result 
     * to the console (as implied by the void return type and problem description).
     *
     * @param numbers The input list of distinct integers.
     */
    public static void closestNumber(List<Integer> numbers) {
        if (numbers == null || numbers.size() < 2) {
            // Nothing to do for less than 2 elements.
            return;
        }

        // Step 1: Sort the list. Time Complexity: O(N log N).
        // Sorting is done in place.
        Collections.sort(numbers);

        // Initialize minDiff to the difference of the first adjacent pair.
        int minDiff = numbers.get(1) - numbers.get(0);

        // List to temporarily store the results before printing.
        // We use a List of Strings or Integers based on the problem's print format.
        // For console output, printing directly is simplest.
        List<String> resultPairs = new ArrayList<>();

        // Step 2 & 3: Iterate through the list once to find minDiff and collect the matching pairs. O(N).
        for (int i = 1; i < numbers.size(); i++) {
            int smaller = numbers.get(i - 1);
            int larger = numbers.get(i);
            int currentDiff = larger - smaller;

            if (currentDiff < minDiff) {
                // Found a new, smaller minimum difference.
                minDiff = currentDiff;
                // Clear the list since all previous pairs no longer qualify.
                resultPairs.clear();
                
                // Add the new minimum pair formatted for output.
                resultPairs.add(smaller + " " + larger);
                
            } else if (currentDiff == minDiff) {
                // Found another pair that matches the current minimum difference.
                resultPairs.add(smaller + " " + larger);
            }
        }

        // Step 4: Print the collected pairs to the console, following the typical HackerRank format.
        for (String pair : resultPairs) {
            System.out.println(pair);
        }
    }

    // You can uncomment and run this main method to test the examples provided in your images:
    /*
    public static void main(String[] args) {
        // Example 1: [6, 2, 4, 10]
        System.out.println("--- Test Case 1 ---");
        closestNumber(new ArrayList<>(Arrays.asList(6, 2, 4, 10))); 
        // Expected Output: 2 4 \n 4 6

        // Example 2: [-4, -2, 1, 3]
        System.out.println("\n--- Test Case 2 ---");
        closestNumber(new ArrayList<>(Arrays.asList(4, -2, 1, 3))); 
        // Expected Output: -2 -4 (Note: Input must be 4, -2, 1, 3)
        // Correct Output for [4, -2, 1, 3]: -4 -2 \n 1 3 (minDiff=2)
    }
    */
}