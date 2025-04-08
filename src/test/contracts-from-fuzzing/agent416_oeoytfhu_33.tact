struct LevelTwo {
    first: Int;
    second: Bool;
}

struct LevelOne {
    nestedVal: LevelTwo;
}

contract Test33 {
    nested: LevelOne;

    init() {
        self.nested = LevelOne{
            nestedVal: LevelTwo{
                first: 55,
                second: true
            }
        };
    }
}
