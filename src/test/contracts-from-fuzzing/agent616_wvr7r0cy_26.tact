contract StrDefault {
    foo: String = "hello";
    opt: String? = null;

    init() {
        self.foo = "world";
        self.opt = "!";
    }
}