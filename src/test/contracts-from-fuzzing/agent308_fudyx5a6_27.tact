struct OptionalString {
    inner: String?;
}

contract OptStrTest {
    store: OptionalString;

    init() {
        self.store = OptionalString{
            inner: null
        };
    }
}
