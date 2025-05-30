struct S1 { f: Int }
struct S2 { f: S1 }
struct S3 { f: S2 }
struct S4 { f: S3 }

contract WithDefaults {
    val: S4;

    init() {
        self.val = S4{
            f: S3{
                f: S2{
                    f: S1{f: 10}
                }
            }
        };
    }
}