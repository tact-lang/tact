struct InnerMost {
    v: Bool?;
}

struct Inner {
    im: InnerMost?;
}

struct Outer {
    inr: Inner?;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            inr: null
        };
    }

    receive() {}
}