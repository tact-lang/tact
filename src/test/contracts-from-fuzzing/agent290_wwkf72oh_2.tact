struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    nested: Inner = Inner{x: 1, y: true};
}
