struct S1 { val: Int; }
struct S2 { st: S1; }
struct S3 { st: S2; }
struct S4 { st: S3; }

contract DeeplyNested4 {
    val: S4;

    init() {
        self.val = S4{
            st: S3{
                st: S2{
                    st: S1{ val: 5 }
                }
            }
        };
    }
}