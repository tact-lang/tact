struct Inner {
    x: Int = 10;
    y: String = "nested";
}

contract TestContract {
    innerField: Inner = Inner{};
    init() {}
}
