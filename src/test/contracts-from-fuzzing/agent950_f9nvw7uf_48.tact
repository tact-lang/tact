// optional param nested in optional struct param
struct PPInner {
    foo: Int?;
    bar: Bool?;
}

struct PPOuter {
    inner: PPInner?;
}

contract ParamOptStruct(
    baz: PPOuter?
) {}