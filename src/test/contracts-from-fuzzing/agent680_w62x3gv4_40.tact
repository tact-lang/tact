contract MixedPersistent {
    foo: Int = 42;
    bar: Bool;
    opt: Int? = null;
    msg: String = "hi";

    init() {
        self.bar = true;
        self.opt = 5;
    }

    receive() {
        let _ = (self.opt != null ? self.opt!! : 0) + self.foo;
    }
}