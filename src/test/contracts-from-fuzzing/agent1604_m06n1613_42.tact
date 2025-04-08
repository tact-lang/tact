struct Level3 {
    leaf: Int;
}

struct Level2 {
    branch: Level3;
}

struct Level1 {
    node: Level2;
}

contract TreeLike {
    root: Level1;

    init() {
        self.root = Level1 {
            node: Level2 {
                branch: Level3 { leaf:123 }
            }
        };
    }

    receive() {}
}