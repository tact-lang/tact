struct OptionString {
    a: String;
    b: String?;
}

contract OptionalStringFields {
    state: OptionString;

    init() {
        self.state = OptionString{ a: "hi", b: null };
    }
}