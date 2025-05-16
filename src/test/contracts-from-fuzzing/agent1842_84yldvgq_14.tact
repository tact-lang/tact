struct StringWrapper {
    content: String;
}

contract OptionalStructDeep {
    wrap: StringWrapper?;

    init() {
        self.wrap = null;
    }
}