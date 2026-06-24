struct SerialParam {
    small: Int as uint4;
    sign: Int as int1;
}

contract SerialNestedParams(
    nested: SerialParam,
    x: Int as uint16,
) {}
