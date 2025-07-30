struct DeepInner { a: Int; b: Bool; c: String; }

struct Inner {
    inner: DeepInner;
    d: String;
    e: Bool;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            inner: DeepInner{ a: 42, b: false, c: "hi" },
            d: "hello",
            e: true
        };
    }
}