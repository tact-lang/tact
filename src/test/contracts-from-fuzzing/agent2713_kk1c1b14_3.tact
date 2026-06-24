struct DeepNested {
    inner: Inner;
}

struct Inner {
    value: Int;
    optionalNested: Nested?;
}

struct Nested {
    foo: Int;
    bar: Int?;
}

contract TestContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{
            inner: Inner{
                value: 7,
                optionalNested: Nested{
                    foo: 42,
                    bar: null,
                }
            }
        };
    }
}
