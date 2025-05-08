// Return to the prior failing example and reformat 
// it as multi-line with one level per line, to exclude line length limit
struct L1 { v: L2 } 
struct L2 { v: L3 }
struct L3 { v: L4 }
struct L4 { v: L5 }
struct L5 { v: L6 }
struct L6 { v: L7 }
struct L7 { v: L8 }
struct L8 { v: L9 }
struct L9 { v: L10 }
struct L10 { v: L11 }
struct L11 { val: Int }

contract TestContract {
    deep: L1;

    init() {
        self.deep = L1{ v:
            L2{ v:
                L3{ v:
                    L4{ v:
                        L5{ v:
                            L6{ v:
                                L7{ v:
                                    L8{ v:
                                        L9{ v:
                                            L10{ v:
                                                L11{ val: 42 }
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
    }
}