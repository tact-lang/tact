struct Nested {
    inner: Int;
    optional: Bool?;
}

struct Holder {
    nested: Nested;
    text: String;
}

contract Test {
    field: Holder;

    init() {
        self.field = Holder{
            nested: Nested{inner: 5, optional: null},
            text: "hello"
        };
    }
}