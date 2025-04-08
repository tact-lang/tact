// Test contract parameter with optional struct param and serialization annotated optional inside
struct ParamS {
    inner: Int? as uint8;
}

contract ParamsMixin(
    p1: Int,
    p2: ParamS?,
    p3: Bool?
) {}
