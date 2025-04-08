struct LevelTwo {
    foo: Int;
    bar: Bool;
}

struct LevelOne {
    inner1: LevelTwo;
    inner2: LevelTwo;
}

contract MultiNestedStructs {
    nestedData: LevelOne;

    init() {
        self.nestedData = LevelOne{
            inner1: LevelTwo{ foo: 1, bar: true },
            inner2: LevelTwo{ foo: 2, bar: false }
        };
    }
}