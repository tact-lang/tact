struct MixedNull {
    a: Int?;
    b: String;
}

contract NullInParam(
    data: MixedNull,
) {}