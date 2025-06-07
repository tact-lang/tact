// optional struct with inner optionals in param
struct OptNestInner {
    a: Int?;
    b: Bool?;
}

contract OptInParam(
    data: OptNestInner?
) {
    receive() {}
}