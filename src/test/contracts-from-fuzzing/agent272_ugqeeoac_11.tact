struct HasString {
    val: String;
}

contract StringInPersist {
    s: HasString;

    init() {
        self.s = HasString{ val: "hi" };
    }
}