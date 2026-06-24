struct InnerMost {
    x: Int;
}

struct Inner {
    im: InnerMost?;
}

contract Test {
    nested: Inner? = null;
}