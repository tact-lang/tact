struct NestedStr {
    name: String;
    note: String?;
}

contract NestedStringFields {
    field: NestedStr = NestedStr { name: "x", note: null };
}