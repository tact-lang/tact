struct Inner {
    x: Int;
    y: Int;
}

contract NestedStorage {
    point: Inner = Inner{x: 1, y: 2};
}
