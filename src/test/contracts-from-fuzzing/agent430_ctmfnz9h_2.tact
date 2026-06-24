struct Inner {
    x: Int;
    y: Int?;
}

contract Test {
    point: Inner = Inner{ x: 1, y: null };
}