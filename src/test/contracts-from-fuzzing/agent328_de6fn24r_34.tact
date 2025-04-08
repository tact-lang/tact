struct MixNested {
    a: Int = 42;
    b: Bool? = null;
    c: Cell? = null;
    d: Inner? = null;
}

struct Inner {
    x: Int = 1;
    y: String? = null;
}

contract Test {
    data: MixNested;
    init() {
        self.data = MixNested{};
    }
}