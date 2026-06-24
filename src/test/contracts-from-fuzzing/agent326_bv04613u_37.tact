struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalNestParams(
    p: OuterOpt,
) {}
