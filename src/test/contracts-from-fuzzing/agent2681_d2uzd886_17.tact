struct S1 {
    s: String;
    b: Bool;
}

struct S2 {
    inner: S1;
    n: Int;
}

struct S3 {
    x: Int;
    inner2: S2;
}

contract DeepStructChain {
    s3: S3;

    init() {
        self.s3 = S3{
            x: 1,
            inner2: S2{
                inner: S1{s: "s", b: true},
                n: 5
            }
        };
    }
}