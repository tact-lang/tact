struct DeepNested {
    val: Int;
}

struct MiddleLevel {
    deep: DeepNested;
}

struct TopLevel {
    middle: MiddleLevel;
}

contract DeepNestedStructTest {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            middle: MiddleLevel{
                deep: DeepNested{
                    val: 99,
                },
            },
        };
    }
}