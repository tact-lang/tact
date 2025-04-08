// Contract parameters + nested defaults
struct SP {
    a: Int = 5;
    b: Bool;
    s: String;
}

contract ParamsTest(
    p1: Int,
    p2: Bool,
    nested: SP,
) {}