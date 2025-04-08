struct Inner {
    optval: Bool?;
}

contract TestContract {
    inner: Inner = Inner{ optval: null };
    init() {}
}