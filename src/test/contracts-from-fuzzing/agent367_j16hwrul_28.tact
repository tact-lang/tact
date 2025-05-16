// optional struct inside contract param
struct Wrap {
    x: Int;
    y: Bool?;
}

contract ParamOptStruct(
    w: Wrap?,
    z: Int
) {
    receive() {}
}