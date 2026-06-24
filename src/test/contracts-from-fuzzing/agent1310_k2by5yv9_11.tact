struct Nested {
    a: Int as uint32;
    b: Bool?;
    s: String;
}

contract TestContract(
    nestedParam: Nested
) {}
