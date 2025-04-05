fun double(x: Int): Int {
    return x + x;
}

fun triple(x: Int): Int {
    return x + x + x;
}

contract TestChain {
    receive() {
        dump(triple(double(7))); // Expected output: 42
    }
}
