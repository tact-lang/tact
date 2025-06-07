struct S0 { f: Int; }
struct S1 { f: S0; }
struct S2 { f: S1; }
struct S3 { f: S2; }
struct S4 { f: S3; }
struct S5 { f: S4; }
struct S6 { f: S5; }
struct S7 { f: S6; }
struct S8 { f: S7; }
struct S9 { f: S8; }

contract Chain9 {
    f:S9;
    init() {
        self.f = S9{
            f: S8{
                f: S7{
                    f: S6{
                        f: S5{
                            f: S4{
                                f: S3{
                                    f: S2{
                                        f: S1{
                                            f: S0{f:1}
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