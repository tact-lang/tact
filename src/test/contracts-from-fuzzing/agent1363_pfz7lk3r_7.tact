struct OptionalNested {
    foo: Int?;
    bar: Nested?;
}

struct Nested {
    alpha: Bool;
    beta: Bool?;
    gamma: Address;
}

contract DeepOptionalFields {
    store: OptionalNested;

    init() {
        self.store = OptionalNested{
            foo: null,
            bar: Nested{
                alpha: true,
                beta: false,
                gamma: myAddress(),
            },
        };
    }
}