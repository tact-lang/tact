struct UnicodeText {
    s1: String;
    s2: String;
}

contract UnicodePersist {
    utfdata: UnicodeText = UnicodeText{
        s1: "hello\nworld",
        s2: "emoji: 👻"
    };

    receive() {
        self.utfdata = self.utfdata;
    }
}