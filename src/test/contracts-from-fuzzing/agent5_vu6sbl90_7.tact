fun testInference() {
    let x = 1;
    x = 2;
}

contract T {
    receive() {
        testInference();
    }
}
