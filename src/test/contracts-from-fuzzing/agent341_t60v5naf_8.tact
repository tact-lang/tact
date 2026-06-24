struct NestedOptionals {
    innerOpt1: Int?;
    innerOpt2: Bool?;
    innerOpt3: String?;
}

struct Level2 {
    nested: NestedOptionals?;
    flag: Bool;
}

contract DoubleOptional {
    storage: Level2;

    init() {
        self.storage = Level2{ nested: null, flag: true };
    }
}