/* Test 5: Deeply nested chain of structs (10 levels deep) */

struct L10 {
    val: Int;
}

struct L9 {
    l10: L10;
}

struct L8 {
    l9: L9;
}

struct L7 {
    l8: L8;
}

struct L6 {
    l7: L7;
}

struct L5 {
    l6: L6;
}

struct L4 {
    l5: L5;
}

struct L3 {
    l4: L4;
}

struct L2 {
    l3: L3;
}

struct L1 {
    l2: L2;
}

fun getDeep(l: L1): Int {
    return l.l2.l3.l4.l5.l6.l7.l8.l9.l10.val;
}

contract TestContract {
    receive() {
        let chain: L1 = L1 {
            l2: L2 {
                l3: L3 {
                    l4: L4 {
                        l5: L5 {
                            l6: L6 {
                                l7: L7 {
                                    l8: L8 {
                                        l9: L9 { l10: L10 { val: 999 } }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        let v = getDeep(chain);
    }
}
