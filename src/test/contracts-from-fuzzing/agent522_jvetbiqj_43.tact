struct L1 { next: L2; }
struct L2 { next: L3; }
struct L3 { next: L4; }
struct L4 { next: L5; }
struct L5 { next: L6; }
struct L6 { next: L7; }
struct L7 { next: L8; }
struct L8 { next: L9; }
struct L9 { next: L10; }
struct L10 { next: L11; }
struct L11 { next: L12; }
struct L12 { next: L13; }
struct L13 { next: L14; }
struct L14 { next: L15; }
struct L15 { next: L16; }
struct L16 { next: L17; }
struct L17 { next: L18; }
struct L18 { next: L19; }
struct L19 { next: L20; }
struct L20 { leaf: Int?; }

contract DeepCrazy {
    root: L1;
    init() {
        self.root = L1{
            next: L2{
                next: L3{
                    next: L4{
                        next: L5{
                            next: L6{
                                next: L7{
                                    next: L8{
                                        next: L9{
                                            next: L10{
                                                next: L11{
                                                    next: L12{
                                                        next: L13{
                                                            next: L14{
                                                                next: L15{
                                                                    next: L16{
                                                                        next: L17{
                                                                            next: L18{
                                                                                next: L19{
                                                                                    next: L20{ leaf: null }
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
    }
}