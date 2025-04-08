struct SimpleNested {
    a: Int;
    b: Bool;
}

contract TestStorage {
    nested: SimpleNested = SimpleNested{ a: 7, b: true };
}