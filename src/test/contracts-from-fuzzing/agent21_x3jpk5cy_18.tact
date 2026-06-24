fun testCatch(n: Int): Int {
    if (n == 0) {
        try {
            throw(1042);
        } catch (_) {
            return 1;
        }
    }
    return n;
}

contract Test {
    receive() {
         // This should return 1 when n is 0 and n otherwise
         testCatch(0);
         testCatch(42);
    }
}
