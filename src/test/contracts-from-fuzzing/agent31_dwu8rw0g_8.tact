struct VeryDeep1 { f: Int }
struct VeryDeep2 { g: VeryDeep1 }
struct VeryDeep3 { h: VeryDeep2 }
struct VeryDeep4 { i: VeryDeep3 }
struct VeryDeep5 { j: VeryDeep4 }
struct VeryDeep6 { k: VeryDeep5 }
struct VeryDeep7 { l: VeryDeep6 }
struct VeryDeep8 { m: VeryDeep7 }
struct VeryDeep9 { n: VeryDeep8 }

contract Test {
    deep: VeryDeep9;
    init() {
        self.deep = VeryDeep9{
            n: VeryDeep8{
                m: VeryDeep7{
                    l: VeryDeep6{
                        k: VeryDeep5{
                            j: VeryDeep4{
                                i: VeryDeep3{
                                    h: VeryDeep2{
                                        g: VeryDeep1{
                                            f: 999
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
