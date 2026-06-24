struct MixedDef {
    name: String = "";
    description: String?;
}

contract MixedDefaults {
    meta: MixedDef;

    init() {
        self.meta = MixedDef{};
    }
}