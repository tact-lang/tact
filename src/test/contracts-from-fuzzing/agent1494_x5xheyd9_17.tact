struct IntBoolString {
    i: Int;
    b: Bool;
    s: String;
}

struct IntBoolOptionalString {
    i: Int;
    b: Bool;
    s: String?;
}

contract DifferentStructsSameFieldsTest {
    field1: IntBoolString;
    field2: IntBoolOptionalString;

    init() {
        self.field1 = IntBoolString{ i: 1, b: true, s: "yes" };
        self.field2 = IntBoolOptionalString{ i: 2, b: false, s: null };
    }
}
