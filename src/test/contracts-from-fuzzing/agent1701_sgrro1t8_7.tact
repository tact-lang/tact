struct OptionalStructField {
    nested: NestedStruct?;
}

struct NestedStruct {
    foo: Int;
    bar: Int;
}

contract OptStructFieldTest {
    storage: OptionalStructField;

    init() {
        self.storage = OptionalStructField{
            nested: null
        };
    }
}