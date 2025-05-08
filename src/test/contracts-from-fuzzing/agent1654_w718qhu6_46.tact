struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct OuterOptParam {
    nested: DeepOptional?;
}

contract ParamOptOpt(
    param: OuterOptParam
) {
    // nested optional inside param
}