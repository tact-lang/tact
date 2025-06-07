struct HasString {
    content: String;
}

contract StringField {
    f: HasString;

    init() {
        self.f = HasString{ content: "Hello" };
    }
}