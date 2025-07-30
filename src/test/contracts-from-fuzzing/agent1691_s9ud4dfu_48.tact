struct S22 { x: Int; }
struct S21 { s: S22; }
struct S20 { s: S21; }
struct S19 { s: S20; }
struct S18 { s: S19; }
struct S17 { s: S18; }
struct S16 { s: S17; }
struct S15 { s: S16; }
struct S14 { s: S15; }
struct S13 { s: S14; }
struct S12 { s: S13; }
struct S11 { s: S12; }
struct S10 { s: S11; }
struct S9  { s: S10; }
struct S8  { s: S9; }
struct S7  { s: S8; }
struct S6  { s: S7; }
struct S5  { s: S6; }
struct S4  { s: S5; }
struct S3  { s: S4; }
struct S2  { s: S3; }
struct S1  { s: S2; }

contract DeepTest {
    s: S1;

    init() {
        self.s = S1{
            s: S2{
                s: S3{
                    s: S4{
                        s: S5{
                            s: S6{
                                s: S7{
                                    s: S8{
                                        s: S9{
                                            s: S10{
                                                s: S11{
                                                    s: S12{
                                                        s: S13{
                                                            s: S14{
                                                                s: S15{
                                                                    s: S16{
                                                                        s: S17{
                                                                            s: S18{
                                                                                s: S19{
                                                                                    s: S20{
                                                                                        s: S21{
                                                                                            s: S22{ x: 42 }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
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