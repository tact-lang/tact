struct S1 {
    a: Int;
}
struct S2 {
    a: Int;
    s1: S1;
}
struct S3 {
    s2: S2;
}
contract TestOrder {
    s3: S3;
    init() {
        self.s3 = S3{ s2: S2{ a:1, s1: S1{ a:2 } } };
    }
}