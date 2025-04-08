// Nested struct params in contract parameter list
struct Nested {
    a: Int;
    b: Bool?;
}

contract TestContract(
    myNested: Nested,
    x: Int
) {
}
