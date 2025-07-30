struct InnerWithOptional {
    x: Int?;
    y: Bool;
}

contract TopLevelOptional {
    s: InnerWithOptional?;

    init() {
        self.s = null;
    }
}