contract AugAssignTest {
    // Test augmented assignment operators: +=, -=, etc. 
    fun testAugAssign(): Int {
        let x: Int = 5;
        x += 3; // equivalent to x = x + 3, expected result 8
        return x;
    }

    receive() {
        // Force compilation by calling testAugAssign
        self.testAugAssign();
    }
}
