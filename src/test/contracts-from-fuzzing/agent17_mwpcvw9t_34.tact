struct SDeep {
    x: Int;
}

struct SMiddle {
    sdeep: SDeep;
}

contract NestedFinal {
    m: SMiddle = SMiddle{sdeep: SDeep{x: 51}};
}