struct InnerMost {
    deepOpt: Int? = null;
}

struct Inner {
    field: InnerMost? = null;
}

struct Wrap {
    nested: Inner? = null;
}

contract ParamNestedOpt(
    data: Wrap
) {}
