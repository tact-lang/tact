struct DeepOptional {
    nested: NestedOpt?;
}

struct NestedOpt {
    lvl: Level?;
}

struct Level {
    val: Int;
}

contract Test {
    val: DeepOptional;
    init() {
        self.val = DeepOptional{ nested: null };
    }
}
