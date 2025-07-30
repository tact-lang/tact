struct NestedDef {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

contract HasDefaults {
    s: NestedDef;

    init() {
        self.s = NestedDef{};
    }
}