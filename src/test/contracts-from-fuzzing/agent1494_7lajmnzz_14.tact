struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    s1: S1;
}

struct S3 {
    c: S2;
    d: S1;
}

contract NestedMulti {
    val: S3;
    init() {
        self.val = S3{
            c: S2{
                b: 1,
                s1: S1{ a: 2 }
            },
            d: S1{ a:3 }
        };
    }
}