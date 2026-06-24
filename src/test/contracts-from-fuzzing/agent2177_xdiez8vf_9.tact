struct OptionalString {
    val: String?;
}

contract OptionalStringTest {
    data: OptionalString;

    init() {
        self.data = OptionalString{val: null};
    }
}