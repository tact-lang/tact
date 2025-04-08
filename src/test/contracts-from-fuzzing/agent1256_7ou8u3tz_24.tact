struct S10 { x: Int; }
struct S9 { s: S10; }
struct S8 { s: S9; }
struct S7 { s: S8; }
struct S6 { s: S7; }
struct S5 { s: S6; }
struct S4 { s: S5; }
struct S3 { s: S4; }
struct S2 { s: S3; }
struct S1 { s: S2; }

contract TenLayerNest {
    root: S1;

    init() {
        self.root = S1{
            s: S2{
                s: S3{
                    s: S4{
                        s: S5{
                            s: S6{
                                s: S7{
                                    s: S8{
                                        s: S9{
                                            s: S10{ x: 42 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}