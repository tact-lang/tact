struct ComplexOptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WithComplexOptional {
    inner: ComplexOptionalStruct?;
}

contract OptionalChain {
    opt: WithComplexOptional;

    init() {
        self.opt = WithComplexOptional{
            inner: null
        };
    }
}