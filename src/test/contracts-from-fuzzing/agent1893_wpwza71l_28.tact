struct InnerMost {
    a: Int;
}

struct MidLayer {
    m: InnerMost;
}

struct OuterLayer {
    o: MidLayer;
}

contract NullInitializer {
    foo: OuterLayer?;

    init() {
        self.foo = null;
    }
}