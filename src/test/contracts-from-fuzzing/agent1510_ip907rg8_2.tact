struct S1 {
    a: Int;
    b: S2;
}

struct S2 {
    c: Int;
    d: S3;
}

struct S3 {
    e: Int;
    f: S4;
}

struct S4 {
    g: Int;
    h: Int;
}

contract ChainNested {
    field: S1;

    init() {
        self.field = S1{
            a: 1,
            b: S2{
                c: 2,
                d: S3{
                    e: 3,
                    f: S4{g: 4, h: 5}
                }
            }
        };
    }
}