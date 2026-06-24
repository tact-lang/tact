// optional param nested in optional struct param w/ optionals
struct XXInner {
    foo: Int?;
    bar: Bool?;
    s: String?;
}

struct XXOuter {
    inner: XXInner?;
    x: Int?;
}

contract ParamOptStructMix(
    baz: XXOuter?
) {}