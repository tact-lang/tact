struct S0 { a: Int; }
struct S1 { a: Int; s0: S0; }
struct S2 { a: Int; s1: S1; }
struct S3 { a: Int; s2: S2; }
struct S4 { a: Int; s3: S3; }
struct S5 { a: Int; s4: S4; }

contract FiveDeep {
    val: S5;

    init() {
        self.val = S5{
            a:0,
            s4: S4{
                a: 1,
                s3: S3{
                    a: 2,
                    s2: S2{
                        a: 3,
                        s1: S1{
                            a: 4,
                            s0: S0{
                                a: 5
                            }
                        }
                    }
                }
            }
        };
    }
}