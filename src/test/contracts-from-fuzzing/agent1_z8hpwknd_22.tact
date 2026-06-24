struct TwoLevels {
    lvl1: Int?;
    lvl2: Int?;
}

contract OptionalStructNullable {
    nested: TwoLevels?;

    init() {
        self.nested = null;
    }
}