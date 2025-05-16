// contract params: optional struct with nested optional and serialization
struct SInner {
    foo: Int? as uint8;
}

struct SOuter {
    s: SInner?;
}

contract ParamWithSerialisedOption(
    s: SOuter?
) {}
