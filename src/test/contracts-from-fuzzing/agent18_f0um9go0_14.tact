struct Level0 { x: Int; }
struct Level1 { l0: Level0; }
struct Level2 { l1: Level1; }
struct Level3 { l2: Level2; }
struct Level4 { l3: Level3; }
contract FiveDeep {
    data: Level4;
    init() {
        self.data = Level4{
            l3: Level3{
                l2: Level2{
                    l1: Level1{
                        l0: Level0{ x: 123 }
                    }
                }
            }
        };
    }
}
