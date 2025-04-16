struct One {
    a: Int;
}
struct Two {
    b: Int;
}

contract ParamsMix(
    one: One,
    two: Two,
    flag: Bool,
    optText: String?
) {}