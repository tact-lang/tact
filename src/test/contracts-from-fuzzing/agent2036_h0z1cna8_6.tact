struct FiveInts {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract Test {
    s: FiveInts;

    init() {
        self.s = FiveInts{ a:1, b:2, c:3, d:4, e:5 };
    }
}