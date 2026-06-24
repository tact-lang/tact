struct InnerOpt {
    a: Int?;
    b: String?;
}
struct OuterOpt {
    inner: InnerOpt;
}

contract OptNestedStructParam(
    maybe: OuterOpt?,
) {}