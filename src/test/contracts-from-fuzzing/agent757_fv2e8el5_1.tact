struct NestedOptional {
    x: Int?;
    y: Int?;
}

struct DeeplyNested {
    nested: NestedOptional;
    flag: Bool;
}

contract DeepNestedFields {
    data: DeeplyNested;
    counter: Int;

    init() {
        self.data = DeeplyNested{
            nested: NestedOptional{
                x: 10,
                y: null
            },
            flag: true
        };
        self.counter = 0;
    }
}