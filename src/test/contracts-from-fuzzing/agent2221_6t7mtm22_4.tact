struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    c: S1;
}

struct S3 {
    d: Int;
    e: S2;
}

struct S4 {
    f: Int;
    g: S3;
}

contract Deep4Nest {
    value: S4;

    init() {
        self.value = S4{
            f: 1,
            g: S3{
                d: 2,
                e: S2{
                    b: 3,
                    c: S1{ a: 4 }
                }
            }
        };
    }
}