struct OptionalFields {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract OptFieldsTest {
    val: OptionalFields;

    init() {
        self.val = OptionalFields{a: null, b: 2, c: null};
    }
}