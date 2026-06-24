struct S0 {
    x: Int?;
}

struct S1 {
    s0: S0?;
}

struct S2 {
    s1: S1?;
}

struct S3 {
    s2: S2?;
}

contract TestContract {
    nestedOpt: S3;
    init() {
        self.nestedOpt = S3{
            s2: S2{
                s1: S1{
                    s0: S0{ x: null }
                }
            }
        };
    }
}