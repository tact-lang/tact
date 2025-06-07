struct Level10 { v: Int; }

struct Level9 { l10: Level10; }

struct Level8 { l9: Level9; }

struct Level7 { l8: Level8; }

struct Level6 { l7: Level7; }

struct Level5 { l6: Level6; }

struct Level4 { l5: Level5; }

struct Level3 { l4: Level4; }

struct Level2 { l3: Level3; }

struct Level1 { l2: Level2; }

contract TestDeepNested {
    receive() {
        // Construct a deeply nested struct chain with 10 levels
        let s: Level1 = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        l5: Level5{
                            l6: Level6{
                                l7: Level7{
                                    l8: Level8{
                                        l9: Level9{
                                            l10: Level10{ v: 42 }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
        // Access the innermost value to ensure full type resolution
        let innermost: Int = s.l2.l3.l4.l5.l6.l7.l8.l9.l10.v;
    }
}
