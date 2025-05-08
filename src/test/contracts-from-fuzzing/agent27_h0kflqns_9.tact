contract TestBitwise {
    // Constant evaluation using bitwise OR in a constant expression
    const VALUE: Int = 1730 + (8 | 8);

    receive() {
        require(self.VALUE == 1738, "bitwise evaluation failed");
        dump(self.VALUE);
    }
}
