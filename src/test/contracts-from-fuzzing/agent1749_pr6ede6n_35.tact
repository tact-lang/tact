struct Params {
    a: Int?;
    b: String?;
    c: Inner?;
}

struct Inner {
    x: Int?;
    y: String?;
}

contract StructParamConstructor(
    params: Params,
) {}