// optional contract parameter, wrapped struct optional
contract OptParam(
    value: Inner?
) {}

struct Inner {
    x: Int;
    y: Bool?
}