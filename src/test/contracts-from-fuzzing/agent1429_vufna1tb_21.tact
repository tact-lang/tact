struct OptionalStr {
    s: String?;
}

contract OptionalStringTest {
    data: OptionalStr;

    init() {
        self.data = OptionalStr{ s: null };
    }
}