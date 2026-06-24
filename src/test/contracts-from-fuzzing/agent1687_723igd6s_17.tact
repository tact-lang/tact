struct HasString {
    s: String;
    flag: Bool;
}

contract StringField {
    data: HasString;

    init() {
        self.data = HasString{ s: "hello", flag: true };
    }
}