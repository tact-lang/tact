struct NestedStr {
    s: String;
}

contract Test {
    f: NestedStr;

    init() {
        self.f = NestedStr{ s: "hello" };
    }
}