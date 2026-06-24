struct Level3 {
    leaf: Int?;
}

struct Level2 {
    child: Level3?;
}

struct Level1 {
    inner: Level2?;
}

contract NestedOptionals {
    root: Level1?;

    init() {
        self.root = null;
    }
}
