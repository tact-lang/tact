struct S1 { a: Int as uint4; }

struct S2 { b: Int? as uint4; }

struct S3 { s1: S1; s2: S2; }

contract StructSerializationTest {
    s: S3;

    init() {
        self.s = S3 {
            s1: S1 { a: 3 },
            s2: S2 { b: null }
        };
    }
}
