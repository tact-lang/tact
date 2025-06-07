struct StructOptDef {
    a: Int? = null;
    b: Bool? = null;
}

contract WithStructOptDef {
    data: StructOptDef;

    init() {
        self.data = StructOptDef{};
    }
}