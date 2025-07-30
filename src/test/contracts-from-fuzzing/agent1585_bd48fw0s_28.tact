struct NestedOptDef {
    sub: Sub?;
}

struct Sub {
    x: Int = 1;
    y: Int = 2;
}

contract DefaultNulls {
    f: NestedOptDef;

    init() {
        self.f = NestedOptDef{ sub: null };
    }
}