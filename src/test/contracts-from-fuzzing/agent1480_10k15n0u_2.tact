struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    nested: Inner = Inner{ a: 1, b: true };
}
