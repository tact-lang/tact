struct DeepInner {
    a: Int;
    b: Bool;
}

struct Outer {
    inside: DeepInner;
    flag: Bool;
}

contract TestNested {
    store: Outer;
    counter: Int = 0;

    init() {
        self.store = Outer { inside: DeepInner{ a: 99, b: false }, flag: true };
        self.counter = 1;
    }

    receive() {
        let _ = self.store.inside.a + self.counter;
    }
}