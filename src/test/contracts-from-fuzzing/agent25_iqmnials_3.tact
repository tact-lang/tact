fun testDiscard(_: Int): Int {
    // '_' discards the parameter. Attempting to refer to it would be an error, so we just return a constant.
    return 42;
}

contract TestDiscardUsage {
    receive() {
       let res = testDiscard(5);
       dump(res);
    }
}
