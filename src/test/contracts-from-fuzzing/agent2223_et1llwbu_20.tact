struct Level3 {
    value: Int;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    inner: Level2?;
}

contract NestedOptionals {
    top: Level1?;

    init() {
        self.top = null;
    }
}