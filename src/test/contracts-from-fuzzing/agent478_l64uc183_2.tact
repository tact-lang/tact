struct InnerMost {
    x: Int;
    y: Bool?;
}

struct Inner {
    a: InnerMost;
    b: InnerMost?;
}

contract DeeplyNested {
    nested: Inner = Inner{
        a: InnerMost{ x: 0, y: null },
        b: null
    };
}