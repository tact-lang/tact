struct NestedDefault {
    inner: InnerDef;
}

struct InnerDef {
    a: Int = 5;
    b: Bool = true;
}

contract C {
    n: NestedDefault;

    init() {
        self.n = NestedDefault{
            inner: InnerDef{}
        };
    }
}