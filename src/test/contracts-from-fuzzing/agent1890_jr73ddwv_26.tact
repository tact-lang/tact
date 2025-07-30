struct DeepNestedOptDefault {
    f1: Int? = null;
    f2: Bool? = null;
}

struct WrapDeepOpt {
    deepInner: DeepNestedOptDefault;
}

contract ContractDeepOpt {
    nested: WrapDeepOpt;

    init() {
        self.nested = WrapDeepOpt{
            deepInner: DeepNestedOptDefault{}
        };
    }
}