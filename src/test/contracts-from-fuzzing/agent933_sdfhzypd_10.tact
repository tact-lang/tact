struct StringHolder {
    a: String;
    b: String;
    c: String;
}

contract Test {
    texts: StringHolder;
    init() {
        self.texts = StringHolder{ a:"x", b:"y", c:"z" };
    }
}