struct Inner {
    a: Int? = null;
    b: Bool = true;
}

struct Outer {
    nested: Inner;
    c: String? = null;
}

contract TestContract {
    s: Outer;
    init() {
        self.s = Outer{
            nested: Inner{ a: 123, b: false },
            c: null
        };
    }
}