struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: Inner;
    c: String;
}

contract NestedStructs {
    storage: Middle;

    init() {
        self.storage = Middle{
            inner: Inner{ a: 7, b: false },
            c: "test",
        };
    }
}