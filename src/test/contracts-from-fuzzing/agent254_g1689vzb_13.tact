struct Level3 {
    val: Int;
}

struct Level2 {
    left: Level3;
    right: Level3;
}

struct Level1 {
    branch1: Level2;
    branch2: Level2;
}

contract TreeStructContract {
    root: Level1;

    init() {
        self.root = Level1{
            branch1: Level2{
                left: Level3{val:1}, right: Level3{val:2}
            },
            branch2: Level2{
                left: Level3{val:3}, right: Level3{val:4}
            }
        };
    }
}