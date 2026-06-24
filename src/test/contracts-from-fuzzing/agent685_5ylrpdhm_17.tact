struct OptionalDeep {
    level1: Int?;
    level2: InnerLevel?;
}

struct InnerLevel {
    inside: Int;
}

contract OptionalLevels {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{ level1: null, level2: null };
    }
}