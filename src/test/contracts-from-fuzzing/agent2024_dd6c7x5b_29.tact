struct N1 { x: Int; }

struct N2 { x: Int; }

struct BigNest {
    a: N1;
    b: N2;
    c: N1;
    d: N2;
}

contract MixedReuseNest {
    val: BigNest;

    init() {
        self.val = BigNest{
            a: N1{x:1},
            b: N2{x:2},
            c: N1{x:3},
            d: N2{x:4}
        };
    }
}