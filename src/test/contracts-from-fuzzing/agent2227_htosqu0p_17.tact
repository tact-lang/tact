struct InnerMost {
    a: Int;
}

struct MiddleNest {
    val: InnerMost;
}

struct OuterNest {
    mid: MiddleNest;
}

contract ParamWithNested(
    state: OuterNest,
) {}