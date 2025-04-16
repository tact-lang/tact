struct Inner {
    s: String;
}

contract InnerStr {
    x: Inner;

    init() {
        self.x = Inner{ s: "hello" };
    }
}