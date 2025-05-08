struct NestedOptionalInner {
    x: Int?;
}

struct NestedOptionalOuter {
    inner: NestedOptionalInner?;
}

contract NestedOptionalField {
    val: NestedOptionalOuter = NestedOptionalOuter{ inner: null };
}