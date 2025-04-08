// Contract parameter list with nested struct param w/optional compositon
struct NestedOpt {
    foo: Int;
    bar: Bool?;
}

contract ParamNestOpt(
    data: NestedOpt,
    flag: Bool?,
) {}