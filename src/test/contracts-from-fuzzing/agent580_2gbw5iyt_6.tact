struct S1 { a: Int }
struct S2 { b: Int }
struct S3 { c: Int }
struct Wrapper {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract MultiNesting {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            s1: S1{ a:1 },
            s2: S2{ b:2 },
            s3: S3{ c:3 }
        };
    }
}