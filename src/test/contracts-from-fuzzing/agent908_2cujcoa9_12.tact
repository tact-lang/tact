struct InnerParams {
    foo: Int;
    bar: Bool;
}

struct OuterParams {
    inner: InnerParams;
    note: String;
}

contract NestedParamContract(
    data: OuterParams,
    id: Int,
    flag: Bool,
) {}