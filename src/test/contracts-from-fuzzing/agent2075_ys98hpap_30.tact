struct HasString {
    s: String;
}

contract DirectStringField {
    direct: String;
    nested: HasString;

    init() {
        self.direct = "hi";
        self.nested = HasString{ s: "hello" };
    }
}