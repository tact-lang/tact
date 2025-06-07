struct NestedParams {
    foo: Int;
    bar: Bool?;
}

contract ParamsContract(
    initVal: Int,
    nest: NestedParams,
) {}
