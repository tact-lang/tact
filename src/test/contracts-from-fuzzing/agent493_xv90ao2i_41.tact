struct S1 { s: String; }
struct S2 { s: S1; }
struct S3 { s: S2; }

contract DeepStrings {
    d: S3;
    init() {
        self.d = S3{
            s: S2{
                s: S1{
                    s: "hi"
                }
            }
        };
    }
}