struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3?;
}

struct Level1 {
    mid: Level2?;
}

contract OptionalDeepNested {
    data: Level1?;

    init() {
        self.data = null;
    }
}
