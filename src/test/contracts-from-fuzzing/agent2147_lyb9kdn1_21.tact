struct ParamNested {
    a: Int;
    b: Bool;
    s: String;
    sl: Slice;
}

contract ParamStyle(
    x: Int,
    flag: Bool,
    nest: ParamNested,
    message: String,
    sliceField: Slice
) {}