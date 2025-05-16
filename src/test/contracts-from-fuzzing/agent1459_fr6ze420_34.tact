// trickier serialization optional param nesting
struct P2 {
    x: Int? as uint16;
}
struct P1 {
    p2: P2?;
}

contract SerParamNest(
    nest: P1?
) {}
