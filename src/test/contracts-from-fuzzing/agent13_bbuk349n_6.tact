struct Level1 {
    value: Int as int256;
}

struct Level2 {
    l1: Level1;
}

struct Level3 {
    l2: Level2;
}

struct Level4 {
    l3: Level3;
}

struct Level5 {
    l4: Level4;
}

struct Level6 {
    l5: Level5;
}

struct Level7 {
    l6: Level6;
}

struct Level8 {
    l7: Level7;
}

struct Level9 {
    l8: Level8;
}

struct Level10 {
    l9: Level9;
}

contract Test {
    receive() {
        let deep = Level10{
            l9: Level9{
                l8: Level8{
                    l7: Level7{
                        l6: Level6{
                            l5: Level5{
                                l4: Level4{
                                    l3: Level3{
                                        l2: Level2{
                                            l1: Level1{
                                                value: 999
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
        let extracted = deep.l9.l8.l7.l6.l5.l4.l3.l2.l1.value;
    }
}
