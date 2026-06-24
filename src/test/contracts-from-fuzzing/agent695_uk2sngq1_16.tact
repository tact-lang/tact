struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    c: S1;
}

struct S3 {
    d: S2;
    e: Int;
}

struct S4 {
    f: S3;
}

contract FourLevels {
    data: S4;

    init() {
        self.data = S4{
            f: S3{
                d: S2{
                    b: 1,
                    c: S1{ a: 2 },
                },
                e: 3,
            }
        };
    }
}