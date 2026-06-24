contract TestContract {
    foo: Int;
    bar: Int?;
    baz: Bool;
    opt: Bool?;
    str: String;
    addr: Address;

    init() {
        self.foo = 1;
        self.bar = null;
        self.baz = true;
        self.opt = null;
        self.str = "hello";
        self.addr = myAddress();
    }
}