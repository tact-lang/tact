struct DeepNested {
    inner1: Bool;
    inner2: Int;
}

struct Nested {
    middle1: DeepNested;
    middle2: Bool;
}

struct TopLevel {
    outer1: Int;
    outer2: Nested;
    outer3: Bool;
}

contract DeepNestContract {
    field: TopLevel;

    init() {
        self.field = TopLevel{
            outer1: 1,
            outer2: Nested{
                middle1: DeepNested{
                    inner1: false,
                    inner2: 100,
                },
                middle2: true,
            },
            outer3: false,
        };
    }
}