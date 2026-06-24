struct StrInts {
    a: String;
    b: Int;
    c: String;
    d: Int;
}

contract MixStringsInts {
    s: StrInts;

    init() {
        self.s = StrInts{ a:"A", b:1, c:"B", d:2 };
    }
}