struct Level0 { x:Int; }
struct Level1 { x:Level0; }
struct Level2 { x:Level1; }
struct Level3 { x:Level2; }
struct Level4 { x:Level3; }

contract LevelDeep5 {
    d: Level4;

    init() {
        self.d = Level4{
            x: Level3{
                x: Level2{
                    x: Level1{
                        x: Level0{ x:0 }
                    }
                }
            }
        };
    }
}
