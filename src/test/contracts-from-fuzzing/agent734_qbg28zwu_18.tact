contract TestContract {
    foo: Int as int64;
    bar: Int as uint32 = 0;
    qux: Bool = false;
    s: String = "abc";

    init() {
        self.foo = 100;
        self.bar = 1000;
        self.qux = true;
        self.s = "xyz";
    }
}