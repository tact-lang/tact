struct X {
    a: Int;
    b: Bool;
}

struct Y {
    x: X?;
    flag: Bool;
}

contract OptParamNested(
    y: Y?,
) {}