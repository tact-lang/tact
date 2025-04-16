struct DeepInner {
    value: Int?;
}

struct Middle {
    inner: DeepInner;
}

contract OptDeepCollapse {
    nested: Middle?;

    init() {
        self.nested = null;
    }
}