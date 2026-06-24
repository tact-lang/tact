struct ParamInner {
    a: Int;
    b: Bool;
}

struct ParamOuter {
    inner: ParamInner;
    s: String;
}

contract ParamNestCtorTest(
    param: ParamOuter,
) {}