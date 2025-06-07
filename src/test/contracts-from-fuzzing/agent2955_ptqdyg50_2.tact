struct Inner {
    x: Int;
    text: String;
    enabled: Bool;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{ x: 7, text: "abc", enabled: true };
    }
}
