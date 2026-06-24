struct HasString {
    name: String;
}

contract InitStringField {
    s: HasString;

    init() {
        self.s = HasString{ name: "test" };
    }
}