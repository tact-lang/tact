struct InnerMost {
    a: Int? = null;
    b: Bool = true;
}

struct Inner {
    x: InnerMost? = null;
}

contract DeepOptionals {
    foo: Inner? = null;
}