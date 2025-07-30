struct DefOpt {
    foo: Int;
    name: String? = null;
}

contract ImplicitDefOpt {
    s: DefOpt;

    init() {
        self.s = DefOpt{
            foo: 99,
        };
    }
}