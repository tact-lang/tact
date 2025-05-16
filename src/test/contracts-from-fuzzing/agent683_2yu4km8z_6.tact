struct S1 {
    v1: Int;
    v2: Bool;
}

struct S2 {
    s1: S1;
    v3: String;
}

struct S3 {
    s2: S2;
    opt: Int?;
}

struct S4 {
    s3: S3;
}

contract DeepChains {
    val: S4;

    init() {
        self.val = S4{
            s3: S3{
                s2: S2{
                    s1: S1{ v1: 10, v2: false },
                    v3: "go"
                },
                opt: null
            }
        };
    }
}