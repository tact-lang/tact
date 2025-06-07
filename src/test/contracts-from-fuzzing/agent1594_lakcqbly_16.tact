struct S1 {
    f1: Int;
    s2: S2;
}
struct S2 {
    f2: Int;
    s3: S3;
}
struct S3 {
    f3: Int;
}

contract Complex {
    val: S1;
    init() {
        self.val = S1{ f1: 1, s2: S2{ f2: 2, s3: S3{ f3: 3 } } };
    }
}