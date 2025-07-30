struct S1 { val: Int }
struct S2 { inside: S1 }
struct S3 { inside: S2 }
struct S4 { inside: S3 }

contract TestContract {
    deepStruct: S4;

    init() {
        self.deepStruct = S4{
            inside: S3{
                inside: S2{
                    inside: S1{ val: 5 }
                }
            }
        };
    }
}