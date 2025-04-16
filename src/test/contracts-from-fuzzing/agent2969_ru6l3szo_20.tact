struct Inner {
    foo: Int?; // no default
}

contract Test {
    inner: Inner = Inner{foo: null};
}