struct Inner {
    a: Int;
    b: Bool;
}

contract TestStorage {
    inner: Inner = Inner{a: 7, b: true};
}
