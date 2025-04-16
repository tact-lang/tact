struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{inner: Inner{a: 1, b: false}, flag: true};
    }
}