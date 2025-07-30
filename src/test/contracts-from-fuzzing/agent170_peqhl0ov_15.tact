struct S1 {
    a: Int;
    b: Int;
}

struct S2 {
    c: S1;
    d: Int;
}

struct S3 {
    e: S2;
    f: S1;
}

contract TestContract {
    fs: S3 = S3{
        e: S2{
            c: S1{ a: 1, b: 2 },
            d: 3,
        },
        f: S1{ a: 4, b: 5 },
    };

    init() {
        self.fs = S3{
            e: S2{
                c: S1{ a: 6, b: 7 },
                d: 8,
            },
            f: S1{ a: 9, b: 10 },
        };
    }

    receive() {
        let _ = self.fs.f.b;
    }
}