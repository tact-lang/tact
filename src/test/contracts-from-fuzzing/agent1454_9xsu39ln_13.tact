struct InnerDef {
    x: Int = 42;
    y: Bool = true;
}

contract DefaultsNested {
    nested: InnerDef;

    init() {
        self.nested = InnerDef{};
    }
}