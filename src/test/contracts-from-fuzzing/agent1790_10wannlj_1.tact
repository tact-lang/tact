struct Inner {
    x: Int = 7;
    y: Bool = false;
}

contract Test {
    nested: Inner = Inner{};
    init() {}
}
