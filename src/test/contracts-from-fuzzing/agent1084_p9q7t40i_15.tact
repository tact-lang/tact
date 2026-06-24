struct OuterOpt {
    inner: Inner?;
}

struct Inner {
    d: Int = 4;
}

contract TestContract {
    nestedOpt: OuterOpt = OuterOpt{};
    init() {}
    receive() {}
}