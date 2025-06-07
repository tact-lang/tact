struct SimpleNested {
    a: Int;
    b: Bool;
}

contract NestedStorage {
    nested: SimpleNested = SimpleNested{ a: 1, b: true };
}