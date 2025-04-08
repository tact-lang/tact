struct S0 { a: Int; }
struct S1 { s0: S0; optS0: S0?; }
struct S2 { s1: S1; optS1: S1?; }
struct S3 { s2: S2; optS2: S2?; }

contract DeepOptionTest {
    s3: S3;
    optS3: S3?;

    init() {
        self.s3 = S3 {
            s2: S2 {
                s1: S1 {
                    s0: S0 { a:1 },
                    optS0: null
                },
                optS1: null
            },
            optS2: null
        };
        self.optS3 = null;
    }
}
