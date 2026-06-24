struct InnerInner {
    flag: Bool;
    text: String;
}

struct Inner {
    pointX: Int;
    maybeInnerInner: InnerInner?;
}

contract DeeplyNestedOptional {
    nested: Inner?;
}