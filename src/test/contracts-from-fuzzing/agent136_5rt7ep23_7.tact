struct NestedOptional {
    x: Int?;
    y: Bool?;
}

struct TopLevel {
    nested1: NestedOptional;
    nested2: NestedOptional;
    flag: Bool;
}

contract Complex {
    top: TopLevel;

    init() {
        self.top = TopLevel{
            nested1: NestedOptional{ x: null, y: true },
            nested2: NestedOptional{ x: 777, y: null },
            flag: false,
        };
    }
}