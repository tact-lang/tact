struct S1 {
    f1: Int;
    f2: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

contract Test10 {
    big: S2;
    init() {
        self.big = S2{
            s1a: S1{ f1:1, f2:2 },
            s1b: S1{ f1:3, f2:4 }
        };
    }
}