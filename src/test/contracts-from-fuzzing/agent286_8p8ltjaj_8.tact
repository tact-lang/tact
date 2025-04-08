struct S1 { x: Int; }
struct S2 { y: Int; }
struct S3 { z: Int; }

struct Inline {
    a: S1;
    b: S2;
    c: S3;
}

contract TestContract {
    triple: Inline;

    init() {
        self.triple = Inline{
            a: S1{x: 1},
            b: S2{y: 2},
            c: S3{z: 3}
        };
    }
}