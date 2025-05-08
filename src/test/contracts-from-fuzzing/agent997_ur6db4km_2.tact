struct Nested {
    i1: Int;
    b: Bool;
}

contract TestContract {
    nested: Nested = Nested{i1: 1, b: true};
}