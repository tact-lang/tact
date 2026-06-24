struct DeepOptional {
    level1: Bool?;
    level2: Int?;
    level3: String?;
    level4: Slice?;
}

contract Test {
    nested: DeepOptional?;

    init() {
        self.nested = null;
    }
}