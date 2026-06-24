struct Level4 {
    val: Int?;
}

struct Level3 {
    node: Level4;
}

struct Level2 {
    node: Level3;
}

struct Level1 {
    node: Level2;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            node: Level2{
                node: Level3{
                    node: Level4{ val: null }
                }
            }
        };
    }
}