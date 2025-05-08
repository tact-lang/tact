struct S10 { s11: Int; }
struct S9 { s10: S10; }
struct S8 { s9: S9; }
struct S7 { s8: S8; }
struct S6 { s7: S7; }
struct S5 { s6: S6; }
struct S4 { s5: S5; }
struct S3 { s4: S4; }
struct S2 { s3: S3; }
struct S1 { s2: S2; }

contract TenDeep {
    field: S1;

    init() {
        self.field = S1{
            s2: S2{
                s3: S3{
                    s4: S4{
                        s5: S5{
                            s6: S6{
                                s7: S7{
                                    s8: S8{
                                        s9: S9{
                                            s10: S10{
                                                s11: 42
                                            }
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