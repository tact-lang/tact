struct Inner {
    x: Int = 10;
    y: Bool = false;
}

contract TestContract {
    data: Inner = Inner{};
    init() {}
    receive() {}
}