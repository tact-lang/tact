struct NestedOptional {
    x: Int?;
    y: Bool?;
}

contract Test9 {
    optNested: NestedOptional?;

    init() {
        self.optNested = null;
    }

    receive() {}
}