struct Inner {
    s: String;
}

struct Outer {
    inner: Inner;
}

contract StringNest {
    store: Outer;

    init() {
        self.store = Outer{
            inner: Inner{s: "nest"},
        };
    }
}
