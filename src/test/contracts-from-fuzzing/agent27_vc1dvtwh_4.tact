fun testInferredExpr() {
    let x = 42;
    x + 1; // No explicit return
}

contract TestContract {
    receive() {
        testInferredExpr();
    }
}
