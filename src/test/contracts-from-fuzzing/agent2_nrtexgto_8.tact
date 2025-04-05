fun testOptionalAssignment(): Int? {
    let x: Int? = null;
    x = 42;
    return x;
}

contract TestContract {
    receive() {
        testOptionalAssignment();
    }
}