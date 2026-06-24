struct HasString {
    s: String;
}

contract DefaultStringField {
    val: HasString = HasString{ s: "hi" };

    init() {
        self.val = HasString{ s: "changed" };
    }
}