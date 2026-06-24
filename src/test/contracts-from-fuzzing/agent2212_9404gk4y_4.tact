struct Inner {
    opt: Int?;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{opt: null};
    }
}
