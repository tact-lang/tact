struct S1 {
    a: Int;
    b: String?
}

struct S2 {
    s: S1;
    c: Bool;
}

struct S3 {
    s: S2;
    d: Int?;
}

contract Test {
    nested: S3;

    init() {
        self.nested = S3{
            s: S2{
                s: S1{ a:10, b:null },
                c: true
            },
            d: null
        };
    }
}