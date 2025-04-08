struct OptString {
    s: String?;
}

contract OptionalStringTest {
    data: OptString;

    init() {
        self.data = OptString{ s: null };
    }
}