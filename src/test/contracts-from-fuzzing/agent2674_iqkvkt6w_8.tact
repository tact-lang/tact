struct DeepOptionalLayers {
    level1: Int?;
    level2: Int?;
    level3: Int?;
    level4: Int?;
    level5: Int?;
}

contract DeepOptionalTest {
    optData: DeepOptionalLayers;

    init() {
        self.optData = DeepOptionalLayers{
            level1: null,
            level2: null,
            level3: null,
            level4: null,
            level5: null,
        };
    }
}