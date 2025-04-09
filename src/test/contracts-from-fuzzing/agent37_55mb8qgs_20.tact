struct OptionalString {
    name: String?;
}

contract StringOptionTest {
    val: OptionalString;

    init() {
        self.val = OptionalString{ name: null };
    }
}
