struct Inner {
    value: Int;
}

contract TestContract {
    nested: Inner = Inner{value: 7};
}