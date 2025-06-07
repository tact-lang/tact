struct Nested {
    id: Int;
    label: String;
}

struct Wrapper {
    nested: Nested?;
}

contract OptionalPacked {
    data: Wrapper = Wrapper{
        nested: null
    };
    init() {
        self.data = Wrapper{
            nested: Nested{
                id: 7,
                label: "test"
            }
        };
    }
}
