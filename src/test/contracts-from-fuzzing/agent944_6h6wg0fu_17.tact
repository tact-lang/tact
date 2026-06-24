struct NestedStruct {
    id: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    label: String;
    flag: Bool?;
}

contract NestedInParam(
    nested: NestedStruct,
) {
    // persistent storage purely by parameters, nested.
}