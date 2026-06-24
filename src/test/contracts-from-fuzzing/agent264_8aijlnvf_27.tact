struct LevelTwo {
    value: Int;
    note: String?;
}

struct LevelOne {
    nested: LevelTwo;
}

contract NestedOptionalString {
    root: LevelOne;

    init() {
        self.root = LevelOne{
            nested: LevelTwo{
                value: 42,
                note: null,
            },
        };
    }
}