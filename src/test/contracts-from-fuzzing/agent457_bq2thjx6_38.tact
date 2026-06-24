struct HasString {
    s: String;
}

contract StringField {
    d: HasString;
    init() {
        self.d = HasString{ s: "foo" };
    }
}