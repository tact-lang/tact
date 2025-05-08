struct Deeper {
    x: Int;
    flag: Bool;
}

struct Nested {
    inner: Deeper;
    value: Int;
}

contract DeepStructContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            inner: Deeper{
                x: 7,
                flag: false,
            },
            value: 99,
        };
    }
}