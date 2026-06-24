struct S1 {
    flag: Bool;
    text: String;
}

struct S2 {
    s1: S1;
    flag: Bool;
}

struct S3 {
    s2: S2;
    value: Int;
}

contract TestContract {
    nested: S3;
    init() {
        self.nested = S3{
            s2: S2{
                s1: S1{
                    flag: true,
                    text: "deep"
                },
                flag: false
            },
            value: 77
        };
    }
}
