struct Wrap {
    val: Int?;
}

contract TopLevelOptionalStruct {
    w: Wrap?;

    init() {
        self.w = null;
    }
}
