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

fun getValue(n: L10): Int {
    return n.l9.l8.l7.l6.l5.l4.l3.l2.l1.a;
}

contract TestContract {
    receive() {
        let deep: L10 = L10 {
            l9: L9 {
                l8: L8 {
                    l7: L7 {
                        l6: L6 {
                            l5: L5 {
                                l4: L4 {
                                    l3: L3 {
                                        l2: L2 {
                                            l1: L1 { a: 42 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        let result = getValue(deep);
        result;
    }
}
