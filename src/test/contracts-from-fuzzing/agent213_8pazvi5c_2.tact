struct Inner {
    a: Int;
    b: Bool;
}

contract TestNested {
    nested: Inner = Inner{a: 2, b: false};
}