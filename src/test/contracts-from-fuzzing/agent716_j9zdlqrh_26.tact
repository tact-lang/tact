struct OptDef {
    foo: Int? = null;
}

contract UsesOptDef {
    s: OptDef;

    init() {
        self.s = OptDef{};
    }
}