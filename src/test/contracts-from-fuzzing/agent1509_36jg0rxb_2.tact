struct MultiOptional {
    foo: Int?;
    bar: Bool?;
    nested: Nested?;
}

struct Nested {
    val: Int?;
    text: String?;
}

contract OptionalFields {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            foo: 12,
            bar: true,
            nested: Nested{
                val: 5,
                text: "text",
            },
        };
    }
}
