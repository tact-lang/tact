// Large nested optional field
struct InnerMost {
    z: Int?;
}

struct Inner {
    im: InnerMost?;
}

struct Outer {
    inner: Inner?;
}

contract OptionalDeepChain {
    store: Outer;

    init() {
        self.store = Outer{ inner: null };
    }
}