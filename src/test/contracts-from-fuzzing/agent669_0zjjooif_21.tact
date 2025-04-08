struct WithString {
    text: String;
    note: String;
}

contract TwoStrings {
    val: WithString;

    init() {
        self.val = WithString{text:"abc", note:"def"};
    }
}