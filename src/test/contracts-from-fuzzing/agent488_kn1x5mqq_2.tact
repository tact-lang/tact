struct Inner {
    x: Int;
    y: Int? = null;
}

contract TestContract {
    nested: Inner = Inner{x: 1};
}