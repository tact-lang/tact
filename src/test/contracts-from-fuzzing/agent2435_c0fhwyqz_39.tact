struct EmbeddedDef {
    inner: Inner;
}

struct Inner {
    x: Int = 10;
    y: Bool = false;
}

contract TestContract {
    data: EmbeddedDef;

    init() {
        self.data = EmbeddedDef{
            inner: Inner{}
        };
    }
}