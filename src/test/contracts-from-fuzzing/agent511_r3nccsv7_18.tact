struct HasString {
    foo: String;
    bar: String?;
}

contract InnerString {
    val: HasString;

    init() {
        self.val = HasString{ foo: "hi", bar: null };
    }
}