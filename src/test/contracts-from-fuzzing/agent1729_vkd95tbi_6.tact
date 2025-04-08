struct NestedOptionalInner {
    num: Int?;
    text: String?;
}

struct NestedOptionalOuter {
    inner: NestedOptionalInner?;
    flag: Bool?;
}

contract OptionalNestTest {
    outerField: NestedOptionalOuter?;
}