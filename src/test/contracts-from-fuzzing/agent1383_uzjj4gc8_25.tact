struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

struct Wrap {
    s1: S1;
    s2: S2;
}

contract MultiWrap {
    w: Wrap;

    init() {
        self.w = Wrap{
            s1: S1{a:1},
            s2: S2{b:2}
        };
    }
}