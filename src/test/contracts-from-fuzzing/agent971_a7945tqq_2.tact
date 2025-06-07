struct Nested {
    value: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    x: Bool;
    y: String?;
}

contract DeepNestedTest {
    nested: Nested;

    init() {
        self.nested = Nested{
            value: 5,
            inner: InnerStruct{x: true, y: null}
        };
    }
}