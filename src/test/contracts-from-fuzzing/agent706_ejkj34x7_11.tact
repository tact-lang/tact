struct HasString {
    txt: String;
}

contract StringPersists {
    s: HasString;

    init() {
        self.s = HasString{ txt: "hello" };
    }
}