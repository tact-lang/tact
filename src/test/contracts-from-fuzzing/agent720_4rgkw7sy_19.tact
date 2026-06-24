struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: String;
    d: S1;
}

struct S3 {
    e: Int;
    f: S2;
}

contract DeepStructs {
    d: S3;

    init() {
        self.d = S3{
            e: 123,
            f: S2{
                c: "foo",
                d: S1{ a: 321, b: true }
            }
        };
    }
}