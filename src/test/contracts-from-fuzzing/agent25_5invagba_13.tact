contract TestBitwise {
    receive() {
        let and: Int = 42 & 15;
        let or: Int = 42 | 15;
        let xor: Int = 42 ^ 15;
        let rem: Int = 42 % 7;
        dump(and);
        dump(or);
        dump(xor);
        dump(rem);
    }
}
