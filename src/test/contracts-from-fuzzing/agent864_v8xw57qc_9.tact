struct Inner {
    s: String;
}

struct Outer {
    optInner: Inner?;
    amount: Int as coins;
}

contract EmbedOptional {
    foo: Outer;
    init() {
        self.foo = Outer{ optInner: null, amount: 100 };
    }
    receive() {
        self.foo = Outer{ optInner: Inner{ s: "hi" }, amount: 200 };
    }
}