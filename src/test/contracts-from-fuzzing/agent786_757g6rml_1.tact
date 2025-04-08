struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    x: Int;
}

contract NestedStorage {
    s: Outer;
    
    init() {
        self.s = Outer{
            inner: Inner{ a: 1, b: true },
            x: 2
        };
    }
}