struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    nested: S1;
}

struct S3 {
    c: Int;
    nested: S2;
}

struct S4 {
    d: Int;
    nested: S3;
}

contract Test {
    s: S4;

    init() {
        self.s = S4{
            d:1,
            nested: S3{
                c:2,
                nested: S2{
                    b:3,
                    nested: S1{
                        a:4
                    }
                }
            }
        };
    }
}