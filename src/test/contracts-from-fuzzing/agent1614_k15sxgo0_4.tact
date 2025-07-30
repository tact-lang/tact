struct NestedOptional {
    a: Int?;
    b: Bool?;
}

contract Test4 {
    nestedOpt: NestedOptional?;

    init() {
        self.nestedOpt = null;
    }
}