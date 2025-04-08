struct ParamNest {
    x: Int?;
    y: String?;
}

contract ParamPersistent(
    foo: Int,
    bar: Bool,
    baz: String,
    nested: ParamNest,
    optVal: Bool?,
    optAddr: Address?,
    optSlice: Slice?,
    optCell: Cell?,
    strVal: String
) {}