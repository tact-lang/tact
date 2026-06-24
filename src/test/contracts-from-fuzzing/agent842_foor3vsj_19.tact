struct Level0 { one: Int; }
struct Level1 { l0: Level0; }
struct Level2 { l1: Level1; }
struct Level3 { l2: Level2; }
struct Level4 { l3: Level3; }
struct Level5 { l4: Level4; }
struct Level6 { l5: Level5; }

contract DeepTree {
    data: Level6;

    init() {
        self.data = Level6{
            l5: Level5{
                l4: Level4{
                    l3: Level3{
                        l2: Level2{
                            l1: Level1{
                                l0: Level0{ one: 123 }
                            }
                        }
                    }
                }
            }
        };
    }

    receive() {
        let _=self.data;
    }
}