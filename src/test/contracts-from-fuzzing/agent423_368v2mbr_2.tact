struct Inner {
    a: Int;
    b: Bool;
}

contract NestedStructStorage {
    nested: Inner = Inner{ a: 1, b: true };
}