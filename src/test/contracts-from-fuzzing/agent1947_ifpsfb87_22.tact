struct Inner {
    flag: Bool = true;
    data: Int? = null;
}

contract DefaultNested {
    nested: Inner;
    init() {
        self.nested = Inner{};
    }
}