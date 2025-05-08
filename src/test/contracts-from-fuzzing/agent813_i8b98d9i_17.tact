struct LevelZero {
    foo: Int;
}

struct LevelOne {
    bar: LevelZero;
}

struct LevelTwo {
    baz: LevelOne;
}

contract DeepChain {
    chain: LevelTwo;

    init() {
        self.chain = LevelTwo{ baz: LevelOne{ bar: LevelZero{ foo: 9 } } };
    }
}