struct Annotated {
    small: Int as uint16;
    large: Int as uint128;
}

contract ParamAnn(
    value: Annotated,
) {}