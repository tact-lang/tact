struct Nested {
    a: Int;
    b: Bool;
}

contract Test {
    field1: Int = 10;
    field2: Bool = true;
    nested: Nested = Nested{a: 1, b: false};
}