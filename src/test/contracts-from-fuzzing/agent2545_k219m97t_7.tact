struct Level2 {
    innerVal: Int;
}

struct Level1 {
    nested: Level2;
}

contract OptionalNestedStruct {
    optNested: Level1?;

    init() {
        self.optNested = null;
    }
}
