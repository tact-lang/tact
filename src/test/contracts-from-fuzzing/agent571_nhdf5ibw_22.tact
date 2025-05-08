struct Inner {
    a: Int as uint8;
    b: Bool;
}

struct Mid {
    inner: Inner;
}

struct Outer {
    mid: Mid;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{mid: Mid{inner: Inner{a: 15, b: true}}};
    }
}