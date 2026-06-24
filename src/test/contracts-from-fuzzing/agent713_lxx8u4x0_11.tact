struct NullableNested {
    foo: Int?;
    bar: String?;
}

struct NullableWrapper {
    nested: NullableNested?;
}

contract OptionalStructFieldTest {
    f: NullableWrapper;

    init() {
        self.f = NullableWrapper{
            nested: null
        };
    }
}