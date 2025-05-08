struct Params {
    x: Int;
    y: Int;
}

struct Wrapper {
    p: Params;
    z: Int;
}

contract ParamStruct(
    compound: Wrapper,
) {}