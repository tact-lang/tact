struct Inner {
    a: Int;
    b: Int?;
}

contract Deep {
    nested: Inner = Inner{ a: 1, b: null };
}