struct S1 { a: Int }
struct S2 { a: Int; b: S1 }
struct S3 { a: Int; b: S2 }
struct S4 { a: Int; b: S3 }
struct S5 { a: Int; b: S4 }
struct S6 { a: Int; b: S5 }
struct S7 { a: Int; b: S6 }
contract DeepWide {
    field: S7;

    init() {
        self.field = S7{
            a: 1,
            b: S6{
                a: 2,
                b: S5{
                    a:3,
                    b:S4{
                        a:4,
                        b:S3{
                            a:5,
                            b:S2{
                                a:6,
                                b:S1{a:7}
                            }
                        }
                    }
                }
            }
        };
    }
}