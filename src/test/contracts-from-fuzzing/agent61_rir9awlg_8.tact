struct L10 { n: Int; }
struct L9  { l10: L10; }
struct L8  { l9: L9; }
struct L7  { l8: L8; }
struct L6  { l7: L7; }
struct L5  { l6: L6; }
struct L4  { l5: L5; }
struct L3  { l4: L4; }
struct L2  { l3: L3; }
struct L1  { l2: L2; }

contract TestDeepChain {
    receive() {
        let chain: L1 = L1 {
            l2: L2 {
                l3: L3 {
                    l4: L4 {
                        l5: L5 {
                            l6: L6 {
                                l7: L7 {
                                    l8: L8 {
                                        l9: L9 {
                                            l10: L10 { n: 999 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        let result: Int = chain.l2.l3.l4.l5.l6.l7.l8.l9.l10.n;
        // For fuzz testing, we just retrieve the value
    }
}
