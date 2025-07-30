struct HasString {
    str: String;
}

contract OptionalStructStr {
    s: HasString?;

    init() {
        self.s = null;
    }
}
