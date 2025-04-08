struct Inner {
    optionalVal: Int?;
}

contract Test {
    optNested: Inner;
    optDirect: Int?;

    init() {
        self.optNested = Inner{ optionalVal: null };
        self.optDirect = null;
    }
}