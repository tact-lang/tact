// Optional struct within optional struct (legal)
struct InnerOpt {
    foo: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract DoubleLayerOpt {
    data: OuterOpt?;

    init() {
        self.data = null;
    }
}