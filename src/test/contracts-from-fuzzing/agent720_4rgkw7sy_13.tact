struct OptStr {
    str: String?;
}

contract OptionalString {
    s: OptStr?;

    init() {
        self.s = null;
    }
}