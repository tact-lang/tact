struct Rec {
    v: Int;
}

contract ParamsNestedParam(
    inner: Rec,
    val: Int
) {
    // multiple params, one is struct
}