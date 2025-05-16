struct OptionalWithString {
    s: String?;
}

contract OptionalStrTest {
    data: OptionalWithString;

    init() {
        self.data = OptionalWithString { s: null };
    }
}