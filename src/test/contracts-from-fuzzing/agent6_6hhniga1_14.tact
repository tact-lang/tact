struct S1 { x: Int }
struct S2 { y: S1 }
struct S3 { z: S2 }
struct S4 { w: S3 }
struct S5 { v: S4 }
struct S6 { u: S5 }
struct S7 { t: S6 }

contract TestContract {
    s: S7;

    init() {
        self.s = S7{
            t: S6{
                u: S5{
                    v: S4{
                        w: S3{
                            z: S2{
                                y: S1{
                                    x: 77
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
