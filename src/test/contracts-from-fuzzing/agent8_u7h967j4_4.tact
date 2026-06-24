struct OptStruct {
    foo: Int?;
    bar: Bool?;
    nested: Inner?;
}

struct Inner {
    baz: Int;
}

contract OptionalFieldsTest {
    data: OptStruct;
    init() {
        self.data = OptStruct{
            foo: null,
            bar: true,
            nested: Inner{ baz: 42 }
        };
    }
}