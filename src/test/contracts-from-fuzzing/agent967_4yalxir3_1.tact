struct Nested {
    inner: StructInner;
}

struct StructInner {
    field1: Int;
    optionalField: Bool?;
}

contract DeepNestedTest {
    storage: Nested;

    init() {
        self.storage = Nested{
            inner: StructInner{
                field1: 123,
                optionalField: true
            }
        };
    }
}
