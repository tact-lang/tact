struct S1 {
    a: Int;
}
struct S2 {
    s1: S1;
}
struct S3 {
    s2: S2;
}
struct S4 {
    s3: S3;
}
struct S5 {
    s4: S4;
}
struct S6 {
    s5: S5;
}
struct S7 {
    s6: S6;
}
struct S8 {
    s7: S7;
}
struct S9 {
    s8: S8;
}
struct S10 {
    s9: S9;
}

contract TestContract {
    data: S10;

    init() {
        self.data = S10{
            s9: S9{
                s8: S8{
                    s7: S7{
                        s6: S6{
                            s5: S5{
                                s4: S4{
                                    s3: S3{
                                        s2: S2{
                                            s1: S1{a:123}
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