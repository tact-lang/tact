struct S1 { a: Int }
struct S2 { b: Int }
struct S3 { c: Int }
struct S4 { d: Int }

struct Big {
    f1: S1;
    f2: S2;
    f3: S3;
    f4: S4;
}

contract BigWrap {
    data: Big;

    init() {
        self.data = Big{
            f1: S1{ a:1 },
            f2: S2{ b:2 },
            f3: S3{ c:3 },
            f4: S4{ d:4 }
        };
    }
}