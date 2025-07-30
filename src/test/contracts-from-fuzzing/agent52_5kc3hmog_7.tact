struct L1 { a: Int; }
struct L2 { l1: L1; }
struct L3 { l2: L2; }
struct L4 { l3: L3; }
struct L5 { l4: L4; }
struct L6 { l5: L5; }
struct L7 { l6: L6; }
struct L8 { l7: L7; }
struct L9 { l8: L8; }
struct L10 { l9: L9; }
struct L11 { l10: L10; }
struct L12 { l11: L11; }
struct L13 { l12: L12; }
struct L14 { l13: L13; }
struct L15 { l14: L14; }

fun getDeepValue(n: L15): Int {
    return n.l14.l13.l12.l11.l10.l9.l8.l7.l6.l5.l4.l3.l2.l1.a;
}

contract TestDeep15 {
    receive() {
        let deep: L15 = L15 {
            l14: L14 {
                l13: L13 {
                    l12: L12 {
                        l11: L11 {
                            l10: L10 {
                                l9: L9 {
                                    l8: L8 {
                                        l7: L7 {
                                            l6: L6 {
                                                l5: L5 {
                                                    l4: L4 {
                                                        l3: L3 {
                                                            l2: L2 {
                                                                l1: L1 { a: 100 }
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
        let result = getDeepValue(deep);
        result;
    }
}
