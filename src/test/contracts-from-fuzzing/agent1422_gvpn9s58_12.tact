struct S {
    a: Int as uint8;  // 0..255
    b: Int as int16; // -32768..32767
    c: Int as uint4; // 0..15
}

contract SerialSizes {
    s: S;
    init() {
        self.s = S{ a:10, b:-10, c:5 };
    }
}