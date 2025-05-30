struct NestedParams {
    label: String;
    idx: Int;
}

contract InitParamTest(
    nested: NestedParams,
    quantity: Int,
    enabled: Bool
) {}