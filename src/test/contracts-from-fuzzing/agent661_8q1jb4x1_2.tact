struct Nested {
    foo: Int;
    bar: Bool?;
    deep: Inner;
}

struct Inner {
    x: Int;
    y: String?;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            foo: 42,
            bar: false,
            deep: Inner{
                x: 5,
                y: "test"
            }
        };
    }
}