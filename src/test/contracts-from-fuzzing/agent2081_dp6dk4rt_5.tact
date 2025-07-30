struct S1 {
    f1: Int;
    f2: String;
}

struct S2 {
    s1: S1;
    f3: Bool;
}

struct S3 {
    s2: S2;
    f4: Int?;
}

contract DeepCompose {
    val: S3;
    init() {
        self.val = S3{
            s2: S2{
                s1: S1{f1: 1, f2: "hi"},
                f3: true,
            },
            f4: null
        };
    }
}