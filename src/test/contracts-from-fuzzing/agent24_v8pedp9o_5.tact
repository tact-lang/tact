contract TestBitwise {
    receive() {
        let andValue: Int = 255 & 15;   // expected 15
        let xorValue: Int = 255 ^ 15;     // expected 240
        let orValue:  Int = 240 | 15;      // expected 255
        let shlValue: Int = 1 << 5;        // expected 32
        let shrValue: Int = 32 >> 5;       // expected 1
        dump(andValue);
        dump(xorValue);
        dump(orValue);
        dump(shlValue);
        dump(shrValue);
        return;
    }
}
