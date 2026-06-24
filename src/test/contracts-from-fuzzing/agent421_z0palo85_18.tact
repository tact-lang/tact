struct N1 { f: Int }
struct N2 { f: N1 }
struct N3 { f: N2 }
struct N4 { f: N3 }
struct N5 { f: N4 }
struct N6 { f: N5 }
struct N7 { f: N6 }
struct N8 { f: N7 }
struct N9 { f: N8 }

contract VeryDeep {
    v: N9;
    init() {
        self.v = N9{
            f: N8{
                f: N7{
                    f: N6{
                        f: N5{
                            f: N4{
                                f: N3{
                                    f: N2{
                                        f: N1{
                                            f: 99
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