struct L20 {
    value: Int
}

struct L19 {
    l20: L20
}

struct L18 {
    l19: L19
}

struct L17 {
    l18: L18
}

struct L16 {
    l17: L17
}

struct L15 {
    l16: L16
}

struct L14 {
    l15: L15
}

struct L13 {
    l14: L14
}

struct L12 {
    l13: L13
}

struct L11 {
    l12: L12
}

struct L10 {
    l11: L11
}

struct L9 {
    l10: L10
}

struct L8 {
    l9: L9
}

struct L7 {
    l8: L8
}

struct L6 {
    l7: L7
}

struct L5 {
    l6: L6
}

struct L4 {
    l5: L5
}

struct L3 {
    l4: L4
}

struct L2 {
    l3: L3
}

struct L1 {
    l2: L2
}

contract TestDeepNesting {
    receive() {
        let nested: L1 = L1 {
            l2: L2 {
                l3: L3 {
                    l4: L4 {
                        l5: L5 {
                            l6: L6 {
                                l7: L7 {
                                    l8: L8 {
                                        l9: L9 {
                                            l10: L10 {
                                                l11: L11 {
                                                    l12: L12 {
                                                        l13: L13 {
                                                            l14: L14 {
                                                                l15: L15 {
                                                                    l16: L16 {
                                                                        l17: L17 {
                                                                            l18: L18 {
                                                                                l19: L19 {
                                                                                    l20: L20 { value: 777 }
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
        dump(nested.l2.l3.l4.l5.l6.l7.l8.l9.l10.l11.l12.l13.l14.l15.l16.l17.l18.l19.l20.value);
    }
}
