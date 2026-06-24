// Contract parameters with nested structs (nested parameter list not allowed)
struct Info {
    x: Int;
    y: Int;
}

contract ParamDemo(
    info: Info,
    count: Int
) {
    receive() {}
}