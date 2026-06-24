struct SOptDef {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

contract StructOptDefaults {
    dat: SOptDef;

    init() {
        self.dat = SOptDef{};
    }
}