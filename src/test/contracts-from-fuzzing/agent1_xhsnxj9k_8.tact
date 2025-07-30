/* Testing the foreach loop construct with map iteration as per documentation
   This snippet initializes a map with three integer key-value pairs,
   then iterates through it using a foreach loop to sum up the values.
*/

fun testForeach(): Int {
    // Create an empty map from Int to Int using angle brackets
    let m: map<Int, Int> = emptyMap();
    
    // Set three key-value pairs in the map
    m.set(1, 10);
    m.set(2, 20);
    m.set(3, 30);

    // Initialize sum to 0
    let sum: Int = 0;

    // Use foreach loop to iterate over map entries. The iteration order is from smallest to largest key.
    foreach (key, value in m) {
        sum = sum + value;
    }

    return sum;  // Expected: 10 + 20 + 30 = 60
}

fun main(): Int {
    return testForeach();
}
