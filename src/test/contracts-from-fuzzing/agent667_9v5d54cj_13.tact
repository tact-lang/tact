struct Level3 {
    deepest: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

struct RootBig {
    inner: Level1;
    flag: Bool;
    note: String;
}

contract DeeplyNestedOptional {
    root: RootBig?;

    init() {
        self.root = null;
    }
}
