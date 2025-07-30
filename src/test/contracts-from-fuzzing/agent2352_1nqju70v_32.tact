struct InnerMost {
    deepVal: Int?;
}

struct Inner {
    nested: InnerMost?;
    text: String;
}

contract DeepParamOptional(
    outer: Inner?
) {}