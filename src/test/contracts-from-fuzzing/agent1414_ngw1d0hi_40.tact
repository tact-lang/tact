struct DefOpt {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

contract DefaultOptionalStruct {
    s: DefOpt;

    init() {
        self.s = DefOpt{};
    }
}