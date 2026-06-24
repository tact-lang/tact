struct Inner {
    flag: Bool;
    text: String;
}

contract DeepNested {
    nested: Inner;

    init() {
        self.nested = Inner{ flag: true, text: "hello" };
    }
}