struct InnerString {
    s: String;
}

contract SetStringPersistent {
    val: InnerString;

    init() {
        self.val = InnerString{ s: "hello world" };
    }
}