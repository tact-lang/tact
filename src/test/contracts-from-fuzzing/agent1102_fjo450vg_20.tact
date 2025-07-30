// Contract parameters nested struct optional
struct ParamStruct {
    a: Int;
    b: Bool?;
    c: String;
}

contract WithStructOptParam(
    val: ParamStruct?,
) {}
