struct HasString {
    s: String;
}

contract DefaultString {
    val: HasString;

    init() {
        self.val = HasString{ s: "" };
    }
}