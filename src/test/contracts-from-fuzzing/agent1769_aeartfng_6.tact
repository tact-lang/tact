struct Level3 {
    leaf: Int?;
}

struct Level2 {
    node: Level3?;
}

struct Level1 {
    branch: Level2?;
}

contract OptionalNested {
    root: Level1?;

    init() {
        self.root = null;
    }
}