// struct that is optional in contract param style deployment
struct ParamsStruct {
    f1: Int;
    f2: Bool?;
}

contract ParamOptional(
    val: ParamsStruct?
) {}