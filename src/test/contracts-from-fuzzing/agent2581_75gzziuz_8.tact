struct Level1 { v:Int; }
struct Level2 { v1: Level1; v2: Level1; }
struct Level3 { v1: Level2; v2: Level2; }

contract WideNested {
    data: Level3;

    init() {
        self.data = Level3{
            v1: Level2{
                v1: Level1{v:1},
                v2: Level1{v:2}
            },
            v2: Level2{
                v1: Level1{v:3},
                v2: Level1{v:4}
            }
        };
    }
}
