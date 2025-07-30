// optional complex struct with nested message and optionals internally
message(999) MessageX {
    foo: Int;
}

struct NestedComplex {
    a: Int;
    optInt: Int?;
    m: MessageX?;
}

contract OptComplexDeep {
    data: NestedComplex? = null;
    init() {}
}