struct Level3 {
    x: Int?;
    y: Bool?;
}

struct Level2 {
    a: Int;
    b: Level3;
}

struct Level1 {
    first: Level2?;
    second: Level2?;
}

contract DualOptionalBranches {
    root: Level1;

    init() {
        self.root = Level1{ first: null, second: null };
    }
}
