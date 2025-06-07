struct WithOptDef {
    v1: Int? = null;
    v2: String? = null;
    v3: Bool? = null;
}

contract OptionDefaults {
    s: WithOptDef;
    init() {
        self.s = WithOptDef{};
    }
}