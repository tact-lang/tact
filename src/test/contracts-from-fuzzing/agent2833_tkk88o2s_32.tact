struct HasStr {
    a: Int;
    b: String;
}

contract EmbeddedStr {
    test: HasStr;

    init() {
        self.test = HasStr{ a:1, b:"string" };
    }
}