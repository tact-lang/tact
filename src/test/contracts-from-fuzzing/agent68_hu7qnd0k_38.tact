struct BigString {
    content: String;
}

contract StringPersist {
    s: BigString;

    init() {
        self.s = BigString{
            content: "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
        };
    }
}
