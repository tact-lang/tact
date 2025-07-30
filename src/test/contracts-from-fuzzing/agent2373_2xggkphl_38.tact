struct HasString {
    s: String;
}

contract StringAsRootField {
    data: HasString;

    init() {
        self.data = HasString{ s: "qqq" };
    }
}