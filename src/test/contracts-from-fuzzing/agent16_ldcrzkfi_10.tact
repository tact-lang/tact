struct S1 {
    f1: Int;
    f2: Bool;
    f3: Int?;
}

struct S2 {
    s1: S1;
    f4: String;
    f5: Bool;
    f6: Int?;
}

struct S3 {
    s2: S2;
    f7: String;
    f8: Bool;
    f9: Int?;
}

contract NestedComplex {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{ f1: 10, f2: true, f3: null },
                f4: "abc",
                f5: false,
                f6: null
            },
            f7: "def",
            f8: true,
            f9: null
        };
    }
}