struct OptionalStruct {
    field1: Int?;
    field2: Bool?;
    nestedOpt: Nested?;
}

struct Nested {
    x: Int;
    y: Bool?;
}

contract TestOpt {
    data: OptionalStruct;
    init() {
        self.data = OptionalStruct{
            field1: null,
            field2: true,
            nestedOpt: Nested{
                x: 5,
                y: null,
            },
        };
    }
}
