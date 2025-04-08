struct VeryDeep {
    l1: Level1;
}

struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3;
}

struct Level3 {
    l4: Level4;
}

struct Level4 {
    l5: Level5;
}

struct Level5 {
    val: Int;
}

contract TestContract {
    deep: VeryDeep = VeryDeep{
        l1: Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        l5: Level5{
                            val: 123
                        }
                    }
                }
            }
        }
    };

    init() {
        self.deep = VeryDeep{
            l1: Level1{
                l2: Level2{
                    l3: Level3{
                        l4: Level4{
                            l5: Level5{
                                val: 456
                            }
                        }
                    }
                }
            }
        };
    }
}
