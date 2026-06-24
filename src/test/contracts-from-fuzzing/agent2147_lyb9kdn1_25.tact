struct InnerParam {
    x: Int = 5;
}

struct OuterParam {
    inner: InnerParam? = InnerParam{};
}

contract ParamOptionalNest(
    outer: OuterParam
) {}