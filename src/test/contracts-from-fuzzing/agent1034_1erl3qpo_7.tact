struct Inner {
    x: Int;
    y: Bool = false;
}

contract NestedDefault {
    data: Inner = Inner{ x: 7 };
}