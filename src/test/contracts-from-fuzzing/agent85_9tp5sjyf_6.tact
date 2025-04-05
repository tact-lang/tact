contract TestBinaryArithmetic {
    receive() {
        dump(5 + 2);    // 7
        dump(9 - 3);    // 6
        dump(3 * 4);    // 12
        dump(10 / 3);   // 3 (integer division)
    }
}
