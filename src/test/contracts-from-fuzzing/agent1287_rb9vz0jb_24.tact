// Large mix of types in params syntax
contract DiverseParams(
    intField: Int,
    boolField: Bool,
    strField: String,
    optInt: Int?,
    optBool: Bool?,
    cellField: Cell,
    sliceField: Slice,
    builderField: Builder,
    optStr: String?,
    addrField: Address,
    optAddr: Address?
) {
    receive() {}
}