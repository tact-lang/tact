struct ParamNest {
    val: Int;
    optStr: String?;
}

contract ParamOptMix(
    a: Int,
    b: Int?,
    label: String,
    comment: String?,
    container: ParamNest?,
) {}