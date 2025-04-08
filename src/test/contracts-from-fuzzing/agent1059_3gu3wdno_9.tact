struct S1 {
    innerStr: String;
}

struct S2 {
    s1: S1;
    intOpt: Int?;
}

struct S3 {
    s2: S2;
    boolField: Bool;
}

contract DeepStrings {
    data: S3;
    init() {
        self.data = S3{
            s2: S2{
                s1: S1{ innerStr: "test" },
                intOpt: null
            },
            boolField: true
        };
    }
}