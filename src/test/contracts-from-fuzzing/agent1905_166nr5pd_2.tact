struct LevelTwo {
    a: Int;
    b: Bool;
}

struct LevelOne {
    x: LevelTwo;
    y: Bool;
}

contract DeepNestedTest {
    nestedStruct: LevelOne;

    init() {
        self.nestedStruct = LevelOne{
            x: LevelTwo{
                a: 42,
                b: false,
            },
            y: true,
        };
    }
}