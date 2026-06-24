struct Level3 {
    leaf: Int?;
}

struct Level2 {
    middle: Level3?;
}

struct Level1 {
    root: Level2?;
}

contract DeepNest {
    tree: Level1;

    init() {
        self.tree = Level1{
            root: Level2{
                middle: Level3{
                    leaf: 99
                }
            }
        };
    }

    receive() {}
}