struct NestedOptField {
    inner: Int?;
}

struct OuterOptField {
    nested: NestedOptField?;
}

contract OptStructNested {
    val: OuterOptField = OuterOptField{
        nested: null,
    };
}
