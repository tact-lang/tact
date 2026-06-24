struct Level3 {
    leaf: Int;
}

struct Level2 {
    node: Level3;
}

struct Level1 {
    branch: Level2;
}

contract DeepNest {
    root: Level1;

    init() {
        self.root = Level1{branch: Level2{node: Level3{leaf: 777}}};
    }
}