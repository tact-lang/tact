// test many nested optional structs in contract param
struct InnerMost {
    val: Int;
}

struct MiddleOpt {
    inner: InnerMost?;
}

contract DeepOptParam(
    m: MiddleOpt?
) {}