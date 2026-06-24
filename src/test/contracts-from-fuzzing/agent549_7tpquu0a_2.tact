struct Nested {
    level: Int;
    deeper: DeepNested;
}

struct DeepNested {
    value: Int;
    flag: Bool;
}

contract DeepTest {
    nested: Nested;

    init() {
        self.nested = Nested{
            level: 5,
            deeper: DeepNested{
                value: 10,
                flag: false,
            },
        };
    }
}