// test optional inside contract param nested struct
struct InnerP {
    foo: Int?;
    bar: Bool?;
}

contract ParamNestedOpt(
    inner: InnerP?
) {}