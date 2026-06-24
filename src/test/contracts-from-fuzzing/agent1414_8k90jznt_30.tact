struct Sub {
    foo: Int;
    bar: String?;
}

struct Top {
    num: Int;
    s: Sub?;
}

contract ParamComplex(
    conf: Top
) {}