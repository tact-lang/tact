struct NestedMultipleLevels {
    lev0: Int;
    lev1: Int?;
    lev2: Int?;
    lev3: Int?;
    lev4: Int?;
    lev5: Int?;
}

contract MultiLevelNested {
    nested: NestedMultipleLevels?;

    init() {
        self.nested = null;
    }
}