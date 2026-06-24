struct DeepWithOptionals {
    inner: Inner?;
    note: String;
}

struct Inner {
    foo: Int?;
}

contract NestedOptionalFieldsTest {
    field: DeepWithOptionals;

    init() {
        self.field = DeepWithOptionals {
            inner: Inner{ foo: null },
            note: "note"
        };
    }
}