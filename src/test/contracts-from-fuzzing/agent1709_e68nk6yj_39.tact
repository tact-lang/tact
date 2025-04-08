// nested structs with serialization annotations inside params
struct NestedAnn {
    x: Int as uint8;
    y: Bool;
    z: String;
}

contract ParamNestedAnn(
    data: NestedAnn,
    flag: Bool?,
) {}
