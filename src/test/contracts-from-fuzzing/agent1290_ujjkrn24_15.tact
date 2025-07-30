struct Sub {
    a: Int?;
    b: String?;
}

struct TopParam {
    x: Int;
    y: Bool?;
    z: Sub?;
}

contract ParamNestedOpt(
    param: TopParam,
) {}