struct LevelTwo {
    a: Bool;
}

struct LevelOne {
    nested: LevelTwo?;
}

contract NullableNestedStruct {
    state: LevelOne;

    init() {
        self.state = LevelOne{
            nested: null,
        };
    }
}