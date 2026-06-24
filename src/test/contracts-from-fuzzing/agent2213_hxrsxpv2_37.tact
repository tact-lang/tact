struct NestedDef {
    i: Int = 42;
    b: Bool = true;
}

contract WithNestedDef {
    s: NestedDef;

    init() {
        self.s = NestedDef{};
    }
}
