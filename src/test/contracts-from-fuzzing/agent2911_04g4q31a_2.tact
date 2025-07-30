struct Inner {
    x: Int = 1;
    y: Int? = null;
}

contract TestContract {
    nested: Inner = Inner{};
}