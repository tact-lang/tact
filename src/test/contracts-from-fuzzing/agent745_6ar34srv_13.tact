struct S0 { a: Int }
struct S1 { a: S0 }
struct S2 { a: S1 }
struct S3 { a: S2 }
struct S4 { a: S3 }
struct S5 { a: S4 }
struct S6 { a: S5 }

contract Deep6 {
    root: S6;
    init() {
        self.root = S6{
            a: S5{
                a: S4{
                    a: S3{
                        a: S2{
                            a: S1{
                                a: S0{
                                    a: 616
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}