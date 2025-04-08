struct OptionalNested {
    field1: Int?;
    field2: Bool?;
    nested: DeepOptional?;
}

struct DeepOptional {
    x: Int;
    y: Bool;
}

contract TestContract {
    optNested: OptionalNested;

    init() {
        self.optNested = OptionalNested{
            field1: null,
            field2: true,
            nested: DeepOptional{
                x: 7,
                y: false
            }
        };
    }
}