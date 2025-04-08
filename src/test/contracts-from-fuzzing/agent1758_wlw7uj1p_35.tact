struct VeryDeep {
    l1: Level1;
}

struct Level1 { l2: Level2; }
struct Level2 { l3: Level3; }
struct Level3 { l4: Level4; }
struct Level4 { l5: Level5; }
struct Level5 { l6: Level6; }
struct Level6 { l7: Level7; }
struct Level7 { l8: Level8; }
struct Level8 { l9: Level9; }
struct Level9 { l10: Level10; }
struct Level10 { num: Int; txt: String?; }

contract StorageTest {
    v: VeryDeep;

    init() {
        self.v = VeryDeep{
            l1: Level1{
                l2: Level2{
                    l3: Level3{
                        l4: Level4{
                            l5: Level5{
                                l6: Level6{
                                    l7: Level7{
                                        l8: Level8{
                                            l9: Level9{
                                                l10: Level10{
                                                    num: 123,
                                                    txt: null
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