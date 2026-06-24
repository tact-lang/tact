struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

struct Inner {
    u: Int;
    optInner: Nested?;
}

contract DeepOptionals {
    data: Inner;

    init() {
        self.data = Inner{ u: 10, optInner: null };
    }
}