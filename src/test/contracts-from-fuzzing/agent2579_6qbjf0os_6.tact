struct S1 {
    x: Int?;
    y: Bool;
}

struct S2 {
    s1: S1?;
    str: String;
}

struct S3 {
    s2: S2;
    num: Int;
}

contract OptionalDeep {
    data: S3;
    init() {
        self.data = S3{
            s2: S2{
                s1: null,
                str: "abc",
            },
            num: 99,
        };
    }
}