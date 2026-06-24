struct Nested {
    inner: Int;
}

contract NestedField {
    nested: Nested = Nested{ inner: 123 };
}