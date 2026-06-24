struct WithString {
    s: String;
}

contract StringAsField {
    f: WithString;

    init() {
        self.f = WithString{ s: "Test" };
    }
}
