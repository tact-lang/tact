struct EscapedString {
    content: String;
    flag: Bool;
}

contract EscapeSeq {
    s: EscapedString;

    init() {
        self.s = EscapedString{
            content: "Hello\nWorld",
            flag: true,
        };
    }
}