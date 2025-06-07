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

contract NestedMix {
    data: S3;

    init() {
        self.data = S3{
            e: 7,
            f: S2{
                c: "hi",
                d: S1{
                    a: 11,
                    b: false
                }
            }
        };
    }
}
