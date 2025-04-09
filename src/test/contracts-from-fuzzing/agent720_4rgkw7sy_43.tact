struct DoubleOpt {
    x: Int?;
}

struct Wrapper {
    d: DoubleOpt?;
}

contract TestNestedParam(
    w: Wrapper?
) {
    receive() {}
}