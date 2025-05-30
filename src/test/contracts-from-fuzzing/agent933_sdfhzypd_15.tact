struct NestedWithOptionals {
    sub: InnerStruct?;
}

struct InnerStruct {
    x: Int?;
    y: String?;
}

contract Test {
    foo: NestedWithOptionals;
    init() {
        self.foo = NestedWithOptionals{ sub: InnerStruct{ x: null, y: null } };
    }
}