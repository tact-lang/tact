struct S1 { a: Int; }
struct S2 { s1: S1; }
struct S3 { s2: S2; s1: S1; }

contract SharedNestedStructsTest {
    st: S3;

    init() {
        self.st = S3{
            s2: S2{ s1: S1{ a: 111 } },
            s1: S1{ a: 222 }
        };
    }
}