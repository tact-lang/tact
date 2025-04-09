struct StringIntMix {
    a: String;
    b: Int;
    c: String;
    d: Int;
}

contract Test {
    sim: StringIntMix;
    init() {
        self.sim = StringIntMix{ a:"a", b:1, c:"c", d:2 };
    }
}