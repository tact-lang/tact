struct DeepNested {
    level1: Int;
    level2: Wrapper;
}

struct Wrapper {
    optionalInt: Int?;
    flag: Bool;
}

contract NestingChains {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            level1: 1,
            level2: Wrapper{
                optionalInt: null,
                flag: true,
            },
        };
    }
}