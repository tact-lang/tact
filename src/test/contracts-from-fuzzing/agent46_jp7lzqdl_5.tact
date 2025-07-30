struct ContainsString {
    s: String;
}

contract StringPersists {
    data: ContainsString;

    init() {
        self.data = ContainsString{ s: "hello world" };
    }
}
