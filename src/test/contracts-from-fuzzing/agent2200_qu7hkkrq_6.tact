struct Inner {
    x: Int;
    y: Bool;
}

contract NestedSimple {
    point: Inner = Inner{x: 1, y: true};
}