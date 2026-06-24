struct WrapInner {
    flag: Bool?; 
    count: Int;
}

struct WrapOuterOptional {
    innerOpt: WrapInner?;
}

contract ContractWithOptWrap {
    foo: WrapOuterOptional;

    init() {
        self.foo = WrapOuterOptional{ innerOpt: null };
    }
}