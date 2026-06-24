struct SInner { f: Int; }

struct S2 {
    i1: SInner;
    i2: SInner;
    i3: SInner;
    i4: SInner;
}

struct S1 {
    s2: S2;
    n: Int;
}

contract Test {
    s: S1;

    init() {
        self.s = S1{
            s2: S2{
                i1: SInner{f:1},
                i2: SInner{f:2},
                i3: SInner{f:3},
                i4: SInner{f:4}
            },
            n: 100
        };
    }
}