fun testAssignment() {
    let a: Int = 5;
    a = 10;
    a += 2;  // augmented assignment, equivalent to a = a + 2
    dump(a); // should dump 12
}

contract Test {
    receive() {
        testAssignment();
    }
}
