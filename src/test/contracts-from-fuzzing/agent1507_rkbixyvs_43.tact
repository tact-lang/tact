struct Lvl1 { i: Int; }
struct Lvl2 { s: Lvl1; }
struct Lvl3 { s: Lvl2; }
struct Lvl4 { s: Lvl3; }
struct Lvl5 { s: Lvl4; }
struct Lvl6 { s: Lvl5; }
struct Lvl7 { s: Lvl6; }
struct Lvl8 { s: Lvl7; }
struct Lvl9 { s: Lvl8; }
struct Lvl10 { s: Lvl9; }

contract UltraDeep10 {
    deep10: Lvl10;

    init() {
        self.deep10 = Lvl10{
            s: Lvl9{
                s: Lvl8{
                    s: Lvl7{
                        s: Lvl6{
                            s: Lvl5{
                                s: Lvl4{
                                    s: Lvl3{
                                        s: Lvl2{
                                            s: Lvl1{ i:1 }
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
