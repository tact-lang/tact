struct S1 { x: Int }
struct S2 { y: Bool }
struct S3 { z: String }

struct Mid {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract WideNestedStructTest {
    nested: Mid;

    init() {
        self.nested = Mid{
            s1: S1{ x: 10 },
            s2: S2{ y: true },
            s3: S3{ z: "hello" }
        };
    }
}