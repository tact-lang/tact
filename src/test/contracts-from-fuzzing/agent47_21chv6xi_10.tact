struct S1 { x: Int; }
struct S2 { x: S1; }
struct S3 { x: S2; }
struct S4 { x: S3; }
struct S5 { x: S4; }
struct S6 { x: S5; }
struct S7 { x: S6; }
struct S8 { x: S7; }
struct S9 { x: S8; }
struct S10 { x: S9; }

contract UltraDeep {
    x: S10;

    init() {
        self.x = S10{
            x: S9{
                x: S8{
                    x: S7{
                        x: S6{
                            x: S5{
                                x: S4{
                                    x: S3{
                                        x: S2{
                                            x: S1{ x: 42 }
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