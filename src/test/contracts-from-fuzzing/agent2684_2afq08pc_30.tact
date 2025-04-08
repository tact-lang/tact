struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
}

struct Both {
    s1: S1;
    s2: S2;
}

contract CombineStructs {
    combined: Both = Both{
        s1: S1{x:1},
        s2: S2{y:2}
    };

    init() {
        self.combined = Both{
            s1: S1{x:11},
            s2: S2{y:22}
        };
    }
}
