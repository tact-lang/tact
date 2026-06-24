struct OptionalString {
    field: String?;
}

contract OptStrTest {
    optStr: OptionalString;

    init() {
        self.optStr = OptionalString{ field: null };
    }

    receive() {
        self.optStr = self.optStr;
    }
}