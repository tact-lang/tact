struct SInner {
    a: Int;
}

struct Container {
    inner: SInner?;
    b: Bool;
}

contract OptionalEmbedded {
    top: Container;

    init() {
        self.top = Container{
            inner: null,
            b: true
        };
    }
}
