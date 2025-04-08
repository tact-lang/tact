// contract with param list including optional nested struct
struct Nested {
    a: Int;
    b: Bool?;
}

contract TestContract(
    optNested: Nested?,
    y: Int
) {
}
