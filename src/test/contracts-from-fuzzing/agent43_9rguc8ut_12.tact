fun add(x: Int, y: Int): Int {
    return x + y;
}

contract TestFuncCall {
    receive() {
        dump(add(10, 20)); // Expected output: 30
    }
}
