struct Inner {
    foo: Int? = null;
    bar: Int = 7;
}

contract TestContract {
    str: Inner = Inner{};
    receive() {}
}