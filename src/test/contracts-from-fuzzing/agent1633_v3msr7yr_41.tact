struct Param1 {
    a: Int;
    b: Bool?;
}
struct Param2 {
    s: String;
    n: Int?;
}

contract MultiNestedParams(
    p1: Param1,
    p2: Param2,
    flag: Bool,
    note: String?,
) {}