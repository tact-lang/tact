struct WithString {
    s: String;
}

contract StringStorage {
    inner: WithString;
    init() {
        self.inner = WithString{
            s: "Hello, Tact"
        };
    }
}