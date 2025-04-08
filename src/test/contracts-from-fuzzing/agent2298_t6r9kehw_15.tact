struct S1 {
    a: Int;
}
struct S2 {
    b: S1;
}
struct S3 {
    c: S2;
}

contract FlattenTest {
    s3: S3;

    init() {
        self.s3 = S3{ c: S2{ b: S1{ a: 123 } } };
    }
}