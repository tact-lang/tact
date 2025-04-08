struct Inner {
    nested: String;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner: Inner{ nested: "hello" }
        };
    }
}