struct NestedDefault {
    a: Int = 1;
    b: String = "b";
}

struct OuterDefault {
    inner: NestedDefault = NestedDefault{};
    c: Bool = false;
}

contract NestDef {
    data: OuterDefault;

    init() {
        self.data = OuterDefault{};
    }
}
