struct S1 {
    x: Int;
}

struct S2 {
    y: Bool;
    s1: S1;
}

struct S3 {
    str: String;
    s2: S2;
}

contract ContractThreeNest {
    nested: S3;

    init() {
        self.nested = S3{
            str: "abc",
            s2: S2{
                y: false,
                s1: S1{x:42},
            },
        };
    }
}