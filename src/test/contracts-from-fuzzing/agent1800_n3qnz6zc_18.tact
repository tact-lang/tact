struct S1 { f: Int; }
struct S2 { f: S1; }
struct S3 { f: S2; }
struct S4 { f: S3; }
struct S5 { f: S4; }
struct S6 { f: S5; }
struct S7 { f: S6; }
struct S8 { f: S7; }

contract DeepestChain {
    s: S8;

    init() {
        self.s = S8{
            f: S7{
                f: S6{
                    f: S5{
                        f: S4{
                            f: S3{
                                f: S2{
                                    f: S1{
                                        f: 777
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