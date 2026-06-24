struct StringLayer {
    info: String;
    nested: String?;
}

contract StringStorage {
    text: StringLayer;

    init() {
        self.text = StringLayer{ info: "abc", nested: null };
    }
}
