struct Level3 {
    value: Int;
}

struct Level2 {
    nested: Level3?;
}

struct Level1 {
    data: Level2?;
}

contract NestedOptionals {
    root: Level1?;

    init() {
        self.root = null;
    }
}