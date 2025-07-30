struct InnerData {
    x: Int;
    y: String;
}

struct NestedWrap {
    wrap: InnerData;
    optInt: Int?;
}

struct OuterMost {
    nest: NestedWrap?;
    status: Bool;
}

contract OptionalOuterMost(
    s: OuterMost?,
    flag: Bool?,
    info: String?,
) {
}