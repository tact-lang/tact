struct ParamStruct {
    x: Int;
}

contract LargeParamList(
    p1: ParamStruct,
    p2: ParamStruct,
    p3: ParamStruct?,
    p4: Int,
    p5: Int?,
    p6: Bool,
    p7: Bool?,
    p8: Slice,
    p9: Slice?,
    p10: Address
) {
    receive() {}
}