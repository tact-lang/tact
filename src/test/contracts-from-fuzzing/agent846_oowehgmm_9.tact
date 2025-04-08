struct S2 {
    flag: Bool;
    num: Int;
}

struct S1 {
    inner1: S2;
    inner2: S2;
}

contract Test {
    nested: S1;

    init() {
        self.nested = S1{
            inner1: S2{ flag: true, num: 3 },
            inner2: S2{ flag: false, num: 4 },
        };
    }
}