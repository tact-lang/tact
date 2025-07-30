struct N {
    x: Int = 7;
}

contract TopLevelOptional {
    x: Int?;
    nested: N?;

    init() {
        self.x = null;
        self.nested = null;
    }
}