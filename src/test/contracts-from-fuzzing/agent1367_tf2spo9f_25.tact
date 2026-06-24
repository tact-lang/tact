struct NestedOptional {
    x: Int?;
    y: Bool?;
}

contract OptRec {
    s: NestedOptional?;

    init() {
        self.s = null;
    }
}