struct S0 { f: Int }
struct S1 { s0: S0 }
struct S2 { s1: S1 }
struct S3 { s2: S2 }
struct S4 { s3: S3 }
struct S5 { s4: S4 }

contract TestContract {
    deep: S5;

    init() {
        self.deep = S5{
            s4:S4{
                s3:S3{
                    s2:S2{
                        s1:S1{
                            s0:S0{f:123}
                        }
                    }
                }
            }
        };
    }
}