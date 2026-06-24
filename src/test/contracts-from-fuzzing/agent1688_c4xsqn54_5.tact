struct Inner { s: String; }

contract WithString {
    inner: Inner;

    init() {
        self.inner = Inner{ s: "hello" };
    }
}