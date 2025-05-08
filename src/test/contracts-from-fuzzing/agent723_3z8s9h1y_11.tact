struct S1 {
    a: Int;
}

struct S2 {
    b: Bool;
    s: S1;
}

struct S3 {
    c: String?;
    s: S2;
}

struct S4 {
    d: Int?;
    s: S3;
}

contract TestContract {
    field: S4;

    init() {
        self.field = S4{
            d: 1,
            s: S3{
                c: null,
                s: S2{
                    b: true,
                    s: S1{ a: 5 }
                }
            }
        };
    }
}