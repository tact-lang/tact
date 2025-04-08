struct Level4 { w: Int; }
struct Level3 { z: Int; l4: Level4; }
struct Level2 { y: Int; l3: Level3; }
struct Level1 { x: Int; l2: Level2; }

contract FourLevelDepthContract {
    storage: Level1;
    init() {
        self.storage = Level1{
            x: 10,
            l2: Level2{
                y: 20,
                l3: Level3{
                    z: 30,
                    l4: Level4{
                        w: 40
                    }
                }
            }
        };
    }
}