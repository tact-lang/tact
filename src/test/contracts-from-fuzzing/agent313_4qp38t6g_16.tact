struct NullableContainer {
    inner: Int?;
    text: String?;
}

contract StructWithNullableFieldsTest {
    a: Int?;
    b: String?;
    c: Bool?;
    d: NullableContainer;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = NullableContainer{ inner: null, text: null };
    }
}