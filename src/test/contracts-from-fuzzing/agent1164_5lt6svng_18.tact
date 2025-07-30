struct Level1 { a: Int }
struct Level2 { l1: Level1 }
struct Level3 { l2: Level2 }
struct Level4 { l3: Level3 }
struct Level5 { l4: Level4 }
struct Level6 { l5: Level5 }
struct Level7 { l6: Level6 }
struct Level8 { l7: Level7 }
struct Level9 { l8: Level8 }
struct Level10 { l9: Level9 }

contract Deep10Nest {
    x: Level10;

    init() {
        self.x = Level10{
            l9: Level9{
                l8: Level8{
                    l7: Level7{
                        l6: Level6{
                            l5: Level5{
                                l4: Level4{
                                    l3: Level3{
                                        l2: Level2{
                                            l1: Level1{a: 999}
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