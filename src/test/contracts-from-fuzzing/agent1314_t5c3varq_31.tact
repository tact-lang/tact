struct NestedOption {
    inn: Int?;
}

contract SimpleNestedOpt {
    nested: NestedOption?;

    init() {
        self.nested = null;
    }
}