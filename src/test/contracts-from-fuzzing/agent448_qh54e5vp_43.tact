struct Wrap {
    inner: InnerWrap;
}

struct InnerWrap {
    x: Int;
    y: Bool;
}

contract ParamWrapStruct(
    w: Wrap,
) {}