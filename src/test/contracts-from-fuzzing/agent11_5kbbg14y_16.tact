contract TestBitwiseOperators {
    receive() {
        let andVal: Int = 3 & 1;     // expected 1
        let orVal: Int = 3 | 1;      // expected 3
        let xorVal: Int = 3 ^ 1;     // expected 2
        let shlVal: Int = 3 << 1;    // expected 6
        let shrVal: Int = 3 >> 1;    // expected 1
        dump(andVal);
        dump(orVal);
        dump(xorVal);
        dump(shlVal);
        dump(shrVal);
    }
}
