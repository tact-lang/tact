fun mySign(x: Int): Int {
    return x < 0 ? -1 : x > 0 ? 1 : 0;
}

contract TestFunctionCall {
    receive() {
        let s: Int = mySign(-42);
        s; // Expected: -1
    }
}
