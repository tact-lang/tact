struct Inner {
    z: Int?;
}

struct ComplexParam {
    a: Int;
    b: Inner?;
}

contract ParamContract(
    data: ComplexParam,
) {}