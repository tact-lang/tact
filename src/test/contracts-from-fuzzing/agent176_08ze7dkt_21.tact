struct S0 { f0: Int }
struct S1 { f1: Int }
struct S2 { f2: Int }
struct S3 { f3: Int }
struct S4 { f4: Int }

struct BigNest {
    a: S0;
    b: S1;
    c: S2;
    d: S3;
    e: S4;
}

contract WideNested {
    nested: BigNest;
    init() {
        self.nested = BigNest{
            a: S0{f0: 0},
            b: S1{f1: 1},
            c: S2{f2: 2},
            d: S3{f3: 3},
            e: S4{f4: 4}
        };
    }
}