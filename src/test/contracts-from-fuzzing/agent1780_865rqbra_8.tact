struct Level5 { v: Int; }
struct Level4 { nested: Level5; }
struct Level3 { nested: Level4; }
struct Level2 { nested: Level3; }
struct Level1 { nested: Level2; }

contract DeepNest5 {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                nested: Level3{
                    nested: Level4{
                        nested: Level5{
                            v: 999
                        }
                    }
                }
            }
        };
    }
}