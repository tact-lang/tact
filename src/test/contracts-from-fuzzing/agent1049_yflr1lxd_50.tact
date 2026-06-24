struct DeepInner {
    a: Int? = null;
    b: Bool? = null;
}

struct OuterLayer {
    c: DeepInner? = null;
}

contract MixDeepDefaults {
    field: OuterLayer? = null;

    init() {
        self.field = null;
    }
}