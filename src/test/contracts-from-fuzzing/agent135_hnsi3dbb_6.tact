struct S1 { a: Int; }
struct S2 { a: Int; }
struct S3 { a: Int; }
struct Nest {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract Test {
    x: Nest;

    init() {
        self.x = Nest{ s1: S1{a:1}, s2: S2{a:2}, s3: S3{a:3} };
    }
}