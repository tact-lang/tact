struct SOptDef {
    v: Int? = null;
}

contract OptionalWithDefault {
    field: SOptDef;

    init() {
        self.field = SOptDef{};
    }
}