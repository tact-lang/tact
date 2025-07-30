struct PNest {
    x: Int as uint8;
}

struct PNest2 {
    a: Bool;
}

contract ParamMulti(
    a: Int,
    b: Bool?,
    c: String,
    n1: PNest,
    n2: PNest2,
) {}