contract TestBitwiseConstant {
    const OR_RESULT: Int = 2 | 4; // Expected: 6

    receive() {
        if (self.OR_RESULT == 6) {
            return;
        }
    }
}
