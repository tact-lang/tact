struct Level2 {
    i: Int;
    b: Bool?;
}

struct Level1 {
    nested: Level2?;
}

contract OptionalDeep {
    val: Level1?;
    init() {
        self.val = Level1{ nested: null };
    }
}
