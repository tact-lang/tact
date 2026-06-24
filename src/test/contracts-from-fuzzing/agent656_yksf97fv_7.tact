struct InnerMost {
    num: Int;
    flag: Bool;
}

struct Middle {
    inner: InnerMost;
    text: String?;
}

struct Outer {
    middle: Middle?;
    status: Bool;
}

contract OptionalDeepNesting(
    o: Outer?,
    id: Int,
) {
}