struct InnerDef {
    foo: Int = 5;
}

struct OuterDef {
    nested: InnerDef? = InnerDef{};
    s: String = "hi";
}

contract NestedDefault {
    x: OuterDef;

    init() {
        self.x = OuterDef{};
    }
}