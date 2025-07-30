struct HasString {
    s: String;
    b: Bool;
}

contract EmbedStringStruct {
    val: HasString;

    init() {
        self.val = HasString{
            s: "abc",
            b: true
        };
    }
}
