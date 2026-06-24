struct InnerNest {
    x: Int?;
    y: Int?;
}

struct OuterNest {
    inn1: InnerNest?;
    inn2: InnerNest?;
}

contract ParamNestedOpt(
    arg: OuterNest,
) {}
