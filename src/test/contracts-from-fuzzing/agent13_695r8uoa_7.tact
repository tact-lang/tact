fun testAssignIntLiteralToVar(): Int {
    let x = 123;
    return x;
}

contract TestContract {
    receive() {
        testAssignIntLiteralToVar();
    }
}