struct DeepOptional {
    field1: Int?;
    field2: Bool?;
    nested: Nested?;
}

struct Nested {
    flag: Bool;
    text: String;
}

contract CrazyOptional {
    state: DeepOptional;

    init() {
        self.state = DeepOptional{
            field1: 42,
            field2: null,
            nested: null
        };
    }
}
