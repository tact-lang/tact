struct Inner {
    a: Int as uint4;
    b: Int as int4;
}

contract NestedSerial {
    inner: Inner;

    init() {
        self.inner = Inner{a:7, b:-3};
    }
}