struct L1 {
    value: Int as int256;
}

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
struct L16 { l15: L15; }
struct L17 { l16: L16; }
struct L18 { l17: L17; }
struct L19 { l18: L18; }
struct L20 { l19: L19; }

contract Test {
    receive() {
        let deep = L20{
            l19: L19{
                l18: L18{
                    l17: L17{
                        l16: L16{
                            l15: L15{
                                l14: L14{
                                    l13: L13{
                                        l12: L12{
                                            l11: L11{
                                                l10: L10{
                                                    l9: L9{
                                                        l8: L8{
                                                            l7: L7{
                                                                l6: L6{
                                                                    l5: L5{
                                                                        l4: L4{
                                                                            l3: L3{
                                                                                l2: L2{
                                                                                    l1: L1{
                                                                                        value: 42
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
        let extracted = deep.l19.l18.l17.l16.l15.l14.l13.l12.l11.l10.l9.l8.l7.l6.l5.l4.l3.l2.l1.value;
    }
}
