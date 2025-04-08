struct NestedOptDef {
    a: Int?;
    b: OptInner?;
}

struct OptInner {
    foo: String?;
    bar: Bool?
}

contract InnerDefaults {
    field: NestedOptDef;
    init() {
        self.field = NestedOptDef{
            a: null,
            b: null
        };
    }
}