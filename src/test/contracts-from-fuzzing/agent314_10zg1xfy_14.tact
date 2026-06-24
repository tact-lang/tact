// very deep nested structure chain

struct S5 { x: Int }
struct S4 { s5: S5 }
struct S3 { s4: S4 }
struct S2 { s3: S3 }
struct S1 { s2: S2 }

contract DeepChainStorage {
    val: S1;
    init() {
        self.val = S1{
            s2: S2{
                s3: S3{
                    s4: S4{
                        s5: S5{ x: 123 }
                    }
                }
            }
        };
    }
}