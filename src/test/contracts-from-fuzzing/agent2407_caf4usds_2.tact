struct DeepNested {
    inner: Nested;
}

struct Nested {
    foo: Int;
    bar: InnerMost;
}

struct InnerMost {
    x: Int?;
    y: Bool;
}

contract TestContract {
    value: DeepNested;

    init() {
        self.value = DeepNested{
            inner: Nested{
                foo: 42,
                bar: InnerMost{
                    x: null,
                    y: true,
                },
            },
        };
    }
}