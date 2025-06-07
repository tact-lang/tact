struct S1 {
    f1: Int;
    f2: Bool;
}

struct S2 {
    s1: S1;
    f3: String;
}

struct S3 {
    s2: S2;
    f4: Int?;
}

contract ChainStructs {
    val: S3;

    init() {
        self.val = S3{
            s2: S2{
                s1: S1{
                    f1: 1,
                    f2: true
                },
                f3: "middle",
            },
            f4: null,
        };
    }
}
