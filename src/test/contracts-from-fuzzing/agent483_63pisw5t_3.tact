struct OptionalString {
    message: String?;
    note: String?;
}

contract OptStrTest {
    val: OptionalString;

    init() {
        self.val = OptionalString{
            message: null,
            note: "some note",
        };
    }
}
