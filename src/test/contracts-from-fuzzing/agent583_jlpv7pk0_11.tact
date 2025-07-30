struct S6 { val: Int; }
struct S5 { s6: S6; }
struct S4 { s5: S5; }
struct S3 { s4: S4; }
struct S2 { s3: S3; }
struct S1 { s2: S2; }

contract DeepChain {
    root: S1;

    init() {
        self.root = S1{
            s2: S2{
                s3: S3{
                    s4: S4{
                        s5: S5{
                            s6: S6{ val: 123 }
                        }
                    }
                }
            }
        };
    }
}