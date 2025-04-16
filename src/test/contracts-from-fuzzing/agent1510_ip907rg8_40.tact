struct Wrap {
    x: Int?;
}

contract TopLevelOpt {
    w: Wrap?;

    init() {
        self.w = null;
    }
}