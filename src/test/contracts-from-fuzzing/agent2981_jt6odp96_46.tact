struct Inner {
    x: Int;
}
contract LargeOptionalInner {
    a: Inner?;
    b: Inner?;
    c: Inner?;
    d: Inner?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}