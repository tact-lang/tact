struct NestedOptionalFields {
    inner1: Int?;
    inner2: Bool?;
    inner3: String?;
}

contract TestNestedOptionals {
    nested: NestedOptionalFields;
    val: Int = 1;

    init() {
        self.nested = NestedOptionalFields{
            inner1: null,
            inner2: true,
            inner3: "hello",
        };
        self.val = 42;
    }
}
