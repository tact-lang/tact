struct NestedOptionals {
    level1: Int?;
    level2: String?;
    level3: Bool?;
}

struct Outer {
    nested: NestedOptionals;
    number: Int;
}

contract DeepOptional {
    data: Outer;

    init() {
        self.data = Outer{
            nested: NestedOptionals{
                level1: null,
                level2: null,
                level3: null,
            },
            number: 123,
        };
    }
}