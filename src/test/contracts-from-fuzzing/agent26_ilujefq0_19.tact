fun testAugAssign(): Int {
    let x: Int = 10;
    x += 5;   // x = 15
    x *= 2;   // x = 30
    return x;
}

contract AugmentedAssignmentTest {
    receive() {
        testAugAssign();
    }
}
