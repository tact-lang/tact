struct InnerS {
    value: Int;
}

struct MiddleS {
    inner: InnerS;
}

struct OuterS {
    middle: MiddleS;
}

contract ContractParamsNest(
    state: OuterS,
) {}