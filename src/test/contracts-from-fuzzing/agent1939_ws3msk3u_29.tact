struct DefaultNest {
    inner: InnerDef;
}

struct InnerDef {
    x: Int = 5;
    y: Bool = true;
}

contract TestContract {
    data: DefaultNest;
    init() {
        self.data = DefaultNest{ inner: InnerDef{} };
    }
}