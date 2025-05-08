struct X1 {
    b: Bool;
}

struct X2 {
    b: Bool;
}

contract MultipleStructParams(
    first: X1,
    second: X2,
    someInt: Int,
    optBool: Bool?,
) {
}