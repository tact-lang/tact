struct Level3 {
    mark: Bool;
}

struct Level2 {
    deepest: Level3;
}

struct Level1 {
    mid: Level2;
}

contract DeepTree {
    root: Level1;

    init() {
        self.root = Level1{
            mid: Level2{
                deepest: Level3{
                    mark: true
                }
            }
        };
    }
}