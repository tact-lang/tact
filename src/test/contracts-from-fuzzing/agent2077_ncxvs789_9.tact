struct InnerParam {
    s: String;
    flag: Bool;
}

struct OuterParam {
    inner: InnerParam;
    num: Int;
}

contract ParamNestTest(
    nested: OuterParam,
) {}