struct S1 {
    a: Int;
}
struct S2 {
    a: Int;
    s1: S1;
}
struct S3 {
    a: Int;
    s2: S2;
}
contract TestContract {
    s3: S3;
    init() {
        self.s3 = S3{
            a: 9,
            s2: S2{
                a: 8,
                s1: S1{ a:7 }
            }
        };
    }
}