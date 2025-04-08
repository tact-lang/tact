// optional struct containing optional fields as contract param
struct InnerOpt {
    a: Int?;
    b: Bool?;
}
struct OuterOpt {
    x: InnerOpt?;
    y: String?;
}

contract ParamNestedOpt(
    foo: OuterOpt?
) {}
