struct Level3 {
    val: Int;
}

struct Level2 {
    inner: Level3?;
}

contract Test {
    nested: Level2;

    init() {
        self.nested = Level2{}; // inner defaults to null
    }
}
