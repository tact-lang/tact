struct Level1 { next: Level2; }
struct Level2 { next: Level3; }
struct Level3 { next: Level4; }
struct Level4 { next: Level5; }
struct Level5 { val: Int; }

contract NestedLevels {
    root: Level1;

    init() {
        self.root = Level1{
            next: Level2{
                next: Level3{
                    next: Level4{
                        next: Level5{
                            val: 123
                        }
                    }
                }
            }
        };
    }
}