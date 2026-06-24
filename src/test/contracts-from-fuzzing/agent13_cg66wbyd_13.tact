struct S1 { a: Int; s2: S2; }
struct S2 { b: Int; s3: S3; }
struct S3 { c: Int; }

contract Test {
    data: S1;

    init() {
        self.data = S1{ a:1, s2: S2{ b:2, s3: S3{ c:3 } } };
    }
}
