///////////////////////////////
// Test 12: Return from Nested Block within a Loop
///////////////////////////////
fun nestedLoopReturn(): Int {
    let sum: Int = 0;
    repeat (5) {
        {
            if (sum > 0) {
                return sum;
            }
        }
        // update sum
        // Tact has no compound assignment. we can do sum += 1;
        // but that's allowed
        sum += 1;
    }
    return sum;
}
