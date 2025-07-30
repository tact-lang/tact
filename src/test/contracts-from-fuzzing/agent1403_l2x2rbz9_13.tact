struct NestedWithOptional {
    aa: Bool?;
}

contract OptWrap {
    nested: NestedWithOptional?;

    init() {
        self.nested = null;
    }
}