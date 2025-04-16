struct HasString {
    t: String;
}

contract StringPersistent {
    val: HasString;

    init() {
        self.val = HasString{ t: "Hello world!" };
    }
}