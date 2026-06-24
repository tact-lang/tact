struct InnerMost {
    val: Int;
}

struct Level2 {
    nested: InnerMost;
}

struct Level1 {
    nested: Level2;
}

contract OptionalDeep {
    val: Level1?;

    init() {
        self.val = null;
    }
}
