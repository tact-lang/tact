struct HasString {
    s: String;
}

contract StringStorage {
    s: HasString;

    init() {
        self.s = HasString{s: "Hello"};
    }
}