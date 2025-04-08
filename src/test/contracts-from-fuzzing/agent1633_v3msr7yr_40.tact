struct NestedParam {
    a: Int;
    b: Bool;
}

struct OuterParam {
    inner: NestedParam;
    s: String;
}

contract NestedParamsContract(
    param: OuterParam,
) {}