struct S1 { val1: Int; }
struct S2 { s1: S1; val2: String; }
struct S3 { s2: S2; val3: Bool; }
struct S4 { s3: S3; val4: Int?; }

contract DeepChainStruct {
    field: S4;

    init() {
        self.field = S4{
            s3: S3{
                s2: S2{
                    s1: S1{ val1: 1 },
                    val2: "hi"
                },
                val3: false
            },
            val4: null
        };
    }
}