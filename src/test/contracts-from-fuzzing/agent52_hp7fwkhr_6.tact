struct OptionalLevels {
    level1: Int?;
    level2: Bool?;
    level3: String?;
}

contract OptionalFields {
    inner: OptionalLevels;

    init() {
        self.inner = OptionalLevels{
            level1: null,
            level2: null,
            level3: null
        };
    }
}
