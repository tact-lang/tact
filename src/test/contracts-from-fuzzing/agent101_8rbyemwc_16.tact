struct S1 {
    v: Int;
}

struct S2 {
    a: S1;
    b: S1;
    c: S1;
    d: S1;
}

contract TestContract {
    x: S2;
    init() {
        self.x = S2{
            a: S1{v:1},
            b: S1{v:2},
            c: S1{v:3},
            d: S1{v:4}
        };
    }
}