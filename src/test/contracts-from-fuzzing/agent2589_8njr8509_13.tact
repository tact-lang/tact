contract NestedOptionalParam(
    nested: DeepOptionalOuter
) {}

struct DeepOptionalInner {
    a: Int?;
    b: Bool?;
}

struct DeepOptionalOuter {
    inner: DeepOptionalInner?;
    s: String?;
}