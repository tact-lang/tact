struct S1 {
    s: String;
}
struct S2 {
    s1: S1;
}
struct S3 {
    s2: S2;
}

contract TestContract {
    s3: S3;

    init() {
        self.s3 = S3{
            s2: S2{ s1: S1{ s: "deep" } }
        };
    }
}