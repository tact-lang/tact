struct Inner {
    a: Int = 1;
    b: Bool = false;
}

contract Test {
    inner: Inner = Inner{ a: 5, b: true };
    init() {}
}