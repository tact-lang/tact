struct S4 { v4: Int; }
struct S3 { s4: S4; v3: Bool; }
struct S2 { s3: S3; v2: String; }
struct S1 { s2: S2; v1: Int; }

contract TestContract {
    deep: S1;

    init() {
        self.deep = S1{
            v1: 5,
            s2: S2{
                v2: "hi",
                s3: S3{
                    v3: true,
                    s4: S4{v4: 42},
                },
            },
        };
    }
}