struct Inner {
    x: Int = 5;
    y: Bool? = null;
    z: String = "abc";
}

contract TestContract {
    s: Inner = Inner{};

    init() {}
}