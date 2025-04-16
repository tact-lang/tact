fun testVarInference() {
    let a = 42; // no explicit type
    let b = a + 10;
}

contract TestContract {
    receive() {
        testVarInference();
    }
}