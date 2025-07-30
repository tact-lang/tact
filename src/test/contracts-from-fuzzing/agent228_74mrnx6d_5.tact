struct S1 {
    s: String = "s1";
    n: Int = 1;
}

struct S2 {
    s: String = "s2";
    n: Int = 2;
    nested: S1;
}

struct S3 {
    s: String = "s3";
    n: Int = 3;
    nested: S2;
}

contract NestedStructs {
    s3: S3;

    init() {
        self.s3 = S3{
            s: "ss3",
            n: 33,
            nested: S2{
                s: "ss2",
                n: 22,
                nested: S1{
                    s: "ss1",
                    n: 11
                }
            }
        };
    }
}