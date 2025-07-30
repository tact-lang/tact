struct VeryDeepNested {
    lvl1: Lvl1;
}

struct Lvl1 { lvl2: Lvl2; }
struct Lvl2 { lvl3: Lvl3; }
struct Lvl3 { lvl4: Lvl4; }
struct Lvl4 { lvl5: Lvl5; }
struct Lvl5 { lvl6: Lvl6; }
struct Lvl6 { lvl7: Lvl7; }
struct Lvl7 { lvl8: Lvl8; }
struct Lvl8 { lvl9: Lvl9; }
struct Lvl9 { leaf: Int; }

contract TestStorage {
    deep: VeryDeepNested;

    init() {
        self.deep = VeryDeepNested{
            lvl1: Lvl1{
                lvl2: Lvl2{
                    lvl3: Lvl3{
                        lvl4: Lvl4{
                            lvl5: Lvl5{
                                lvl6: Lvl6{
                                    lvl7: Lvl7{
                                        lvl8: Lvl8{
                                            lvl9: Lvl9{
                                                leaf: 999
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