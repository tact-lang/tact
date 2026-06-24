message(50) EM {}

struct Inner {
    v: Int?;
    flag: Bool = true;
}

struct ComplexParam {
    nested: Inner;
    msg: EM;
}

contract ParamStructMixed(
    param: ComplexParam,
) {}