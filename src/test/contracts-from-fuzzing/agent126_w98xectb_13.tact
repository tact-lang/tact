struct ParamChild {
    a: Int;
    opt: String?;
}

contract Defaults {
    base: Int = 5;
    nested: ParamChild;

    init() {
        self.nested = ParamChild{ a: 11, opt: null };
    }
}