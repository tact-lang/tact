struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
    y: Int;
}

contract Test {
    s2: S2;

    init() {
        self.s2 = S2{
            s1: S1{x:123},
            y:456
        };
    }
}