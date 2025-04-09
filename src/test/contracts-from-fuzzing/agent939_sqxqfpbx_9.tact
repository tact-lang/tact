struct InnerMost {
    s: String;
}

struct Inner {
    im: InnerMost;
    b: Bool;
}

struct Outer {
    inner: Inner;
    addr: Address;
}

contract DeepNest {
    nest: Outer;

    init() {
        self.nest = Outer {
            inner: Inner {
                im: InnerMost {s: "hello"},
                b: false },
            addr: myAddress()
        };
    }
}