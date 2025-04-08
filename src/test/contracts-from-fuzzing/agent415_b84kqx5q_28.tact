struct SInner {
    a: Int = 0;
}

struct SOuter {
    inner: SInner;
    b: Bool = false;
}

contract NestedWithDefaults {
    foo: SOuter;

    init() {
        self.foo = SOuter{
            inner: SInner{a: 5},
            b: true
        };
    }
}