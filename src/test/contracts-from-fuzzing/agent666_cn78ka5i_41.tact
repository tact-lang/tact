struct InnerDef {
    v: Int = 7;
}

struct Container {
    inner: InnerDef;
}

contract NestedDefaults {
    d: Container;

    init() {
        self.d = Container{ inner: InnerDef{} };
    }
}
