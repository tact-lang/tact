// Very long chain of nested contract fields to test limits
struct F1 { x: Int; }
struct F2 { f1: F1; }
struct F3 { f2: F2; }
struct F4 { f3: F3; }
struct F5 { f4: F4; }
struct F6 { f5: F5; }
struct F7 { f6: F6; }
struct F8 { f7: F7; }
struct F9 { f8: F8; }
struct F10 { f9: F9; }

contract UltraDeepChain {
    root: F10;
    init() {
        self.root = F10{
            f9: F9{
                f8: F8{
                    f7: F7{
                        f6: F6{
                            f5: F5{
                                f4: F4{
                                    f3: F3{
                                        f2: F2{
                                            f1: F1{x:777}
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
