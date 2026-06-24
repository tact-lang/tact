struct DeepInner {
    foo: String?;
}

struct Mid {
    di: DeepInner?;
    count: Int;
}

struct Outer {
    mid: Mid;
    active: Bool;
}

contract TestContract {
    store: Outer;

    init() {
        self.store = Outer{
            mid: Mid{ di: DeepInner{ foo: null }, count: 7 },
            active: true
        };
    }
}