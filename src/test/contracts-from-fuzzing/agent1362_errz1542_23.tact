struct NestedStrOpt {
    name: String?;
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool?;
}

contract NestedStrOptField {
    field: NestedStrOpt = NestedStrOpt{
        name: null,
        inner: null
    };
}