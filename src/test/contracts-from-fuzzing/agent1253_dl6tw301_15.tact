struct Level3 { z: Int; }
struct Level2 { y: Level3; }
struct Level1 { x: Level2; }

contract Deep3 {
    nested: Level1;

    init() {
        self.nested = Level1{
            x: Level2{
                y: Level3{
                    z: 1337
                }
            }
        };
    }

    receive() {}
}