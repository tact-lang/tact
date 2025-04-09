struct Innermost {
    a: Int;
}
struct Inner {
    val: Innermost;
}
contract Deep {
    store: Inner = Inner{ val: Innermost{ a: 33 } };

    init() {
        self.store = self.store;
    }

    receive() {
        self.store = self.store;
    }
}