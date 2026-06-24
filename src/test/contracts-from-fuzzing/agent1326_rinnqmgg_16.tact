struct Level1 { x: Int = 1; }
struct Level2 { l1: Level1; }
struct Level3 { l2: Level2; }
struct Level4 { l3: Level3; }

contract DeepNest {
    top: Level4;

    init() {
        self.top = Level4{
            l3: Level3{
                l2: Level2{
                    l1: Level1{ x: 999 }
                }
            }
        };
    }

    receive() {
        let _ = self.top;
    }
}