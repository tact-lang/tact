struct DeepInner {
    k: Bool?;
}

struct Inner {
    x: Int;
    d: DeepInner;
}

struct Outer {
    a: Inner;
    b: Int;
}

contract TestContract {
    store: Outer;

    init() {
        self.store = Outer{
            a: Inner{x:42, d: DeepInner{k: false}},
            b: 7
        };
    }
}