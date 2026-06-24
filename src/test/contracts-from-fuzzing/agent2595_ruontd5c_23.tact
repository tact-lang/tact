struct NestedOptionalLayer {
    level1: String?;
    level2: String?;
    level3: String?;
    level4: String?;
    level5: String?;
}

contract MultiOptionalFields {
    nestedOpt: NestedOptionalLayer;

    init() {
        self.nestedOpt = NestedOptionalLayer{
            level1: null,
            level2: null,
            level3: null,
            level4: null,
            level5: null
        };
    }
}