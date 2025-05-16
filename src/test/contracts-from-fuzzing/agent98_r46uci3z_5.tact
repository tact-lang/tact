struct OptionalLayers {
    level1: Int?;
    level2: Bool?;
    level3: String?;
}

contract OptionalStructTest {
    opt: OptionalLayers;

    init() {
        self.opt = OptionalLayers{
            level1: null,
            level2: null,
            level3: null,
        };
    }
}