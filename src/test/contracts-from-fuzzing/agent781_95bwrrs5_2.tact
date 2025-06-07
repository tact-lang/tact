struct Inner {
    x: Int;
    y: Bool;
    s: String;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{
            x: 10,
            y: true,
            s: "abc"
        };
    }
}