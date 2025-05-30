struct NestedOptional {
    innerOpt1: Int?;
    innerOpt2: Bool?;
}

contract TestStorage {
    nested: NestedOptional?;

    init() {
        self.nested = null;
    }
}