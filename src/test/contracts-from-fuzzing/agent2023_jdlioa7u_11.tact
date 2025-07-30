struct ReallyDeep1 { f: Int }
struct ReallyDeep2 { d1: ReallyDeep1 }
struct ReallyDeep3 { d2: ReallyDeep2 }
struct ReallyDeep4 { d3: ReallyDeep3 }
struct ReallyDeep5 { d4: ReallyDeep4 }
struct ReallyDeep6 { d5: ReallyDeep5 }
struct ReallyDeep7 { d6: ReallyDeep6 }
struct ReallyDeep8 { d7: ReallyDeep7 }

contract TestContract {
    deepChain: ReallyDeep8;
    
    init() {
        self.deepChain = ReallyDeep8{
            d7: ReallyDeep7{
                d6: ReallyDeep6{
                    d5: ReallyDeep5{
                        d4: ReallyDeep4{
                            d3: ReallyDeep3{
                                d2: ReallyDeep2{
                                    d1: ReallyDeep1{
                                        f: 123
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }

    receive() {
        let n = self.deepChain.d7.d6.d5.d4.d3.d2.d1.f;
    }
}