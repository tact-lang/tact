struct OptionalMix {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalMixDefaults {
    nested: OptionalMix?;

    init() {
        self.nested = null;
    }
}