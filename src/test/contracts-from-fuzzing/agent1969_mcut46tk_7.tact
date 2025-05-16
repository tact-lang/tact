struct Level3 {
    leaf: Int;
}

struct Level2 {
    child: Level3;
}

struct Level1 {
    node: Level2;
}

contract DeepTree {
    branch: Level1;

    init() {
        self.branch = Level1{
            node: Level2{
                child: Level3{
                    leaf: 999
                }
            }
        };
    }
}