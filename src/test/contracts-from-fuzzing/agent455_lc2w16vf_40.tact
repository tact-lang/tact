struct SDefaultInnerOpt {
    foo: Int? = null;
    bar: Bool? = true;
    baz: String? = null;
}

contract TestDefOpt {
    x: SDefaultInnerOpt;

    init() {
        self.x = SDefaultInnerOpt{};
    }
}