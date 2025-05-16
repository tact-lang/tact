struct S1 { x: Int; }
struct S2 { y: Int; }
struct S3 { z: Int; }
struct S4 { w: Int; }

struct Big {
    a: S1;
    b: S2;
    c: S3;
    d: S4;
}

contract NestedWide {
    big: Big = Big{
        a: S1{ x:1 },
        b: S2{ y:2 },
        c: S3{ z:3 },
        d: S4{ w:4 }
    };
}