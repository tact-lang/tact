struct S1 {
    x: Int?;
    y: Bool;
}

struct S2 {
    inner1: S1?;
    inner2: S1;
}

contract OptStructs {
    s2: S2;

    init() {
        self.s2 = S2{
            inner1: null,
            inner2: S1{ x: 4, y: true }
        };
    }
}