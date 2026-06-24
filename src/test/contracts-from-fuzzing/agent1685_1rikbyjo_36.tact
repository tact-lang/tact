struct OptString {
    s: String?;
}

contract OptionalStrTest {
    store: OptString;

    init() {
        self.store = OptString{ s: null };
    }
}
