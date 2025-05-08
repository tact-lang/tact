struct WrapStr {
    s: String;
}

contract HasString {
    inner: WrapStr;
    init() {
        self.inner = WrapStr{s: "hello"};
    }
}