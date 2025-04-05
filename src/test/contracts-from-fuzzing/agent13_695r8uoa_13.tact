fun testOptionalAssignment(): Int? {
    let v: Int? = null;
    v = 42;
    return v;
}

contract TestContract {
    receive() {
        testOptionalAssignment();
    }
}