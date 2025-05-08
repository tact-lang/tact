struct L15 {
    Value: Int;
}

struct L14 {
    L15: L15;
}

struct L13 {
    L14: L14;
}

struct L12 {
    L13: L13;
}

struct L11 {
    L12: L12;
}

struct L10 {
    L11: L11;
}

struct L9 {
    L10: L10;
}

struct L8 {
    L9: L9;
}

struct L7 {
    L8: L8;
}

struct L6 {
    L7: L7;
}

struct L5 {
    L6: L6;
}

struct L4 {
    L5: L5;
}

struct L3 {
    L4: L4;
}

struct L2 {
    L3: L3;
}

struct L1 {
    L2: L2;
}

contract TestDeeplyNested15 {
    receive() {
        let chain: L1 = L1 {
            L2: L2 {
                L3: L3 {
                    L4: L4 {
                        L5: L5 {
                            L6: L6 {
                                L7: L7 {
                                    L8: L8 {
                                        L9: L9 {
                                            L10: L10 {
                                                L11: L11 {
                                                    L12: L12 {
                                                        L13: L13 {
                                                            L14: L14 {
                                                                L15: L15 { Value: 12345 }
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
        dump(chain.L2.L3.L4.L5.L6.L7.L8.L9.L10.L11.L12.L13.L14.L15.Value);
    }
}
