struct InnerMost {
    num: Int;
}

struct Inner {
    nested: InnerMost;
}

contract ParamTestDeep(
    rec: Inner
) {}
