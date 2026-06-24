struct Inner {
    a: Int;
    b: Bool?;
}

struct Middle {
    inner: Inner;
    val: String;
}

contract DeepNesting {
    top: Middle;

    init() {
        self.top = Middle {
            inner: Inner { a: 1, b: null },
            val: "ok",
        };
    }
}