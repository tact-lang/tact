struct Level3 {
    value: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract ThreeLevel {
    root: Level1;

    init() {
        self.root = Level1{nested: Level2{nested: Level3{value:123}}};
    }
}