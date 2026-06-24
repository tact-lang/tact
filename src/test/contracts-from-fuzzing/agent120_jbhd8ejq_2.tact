struct Inner {
    field1: Int;
    field2: Bool;
}

contract Test {
    nested: Inner = Inner{
        field1: 1,
        field2: true,
    };
}