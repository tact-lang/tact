struct L10 {
    value: Int;
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

contract TestDeepNested {
    receive() {
        let deep = L1 {
            l2: L2 {
                l3: L3 {
                    l4: L4 {
                        l5: L5 {
                            l6: L6 {
                                l7: L7 {
                                    l8: L8 {
                                        l9: L9 {
                                            l10: L10 { value: 123 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        dump(deep.l2.l3.l4.l5.l6.l7.l8.l9.l10.value);
    }
}
