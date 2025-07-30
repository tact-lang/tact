contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Address;
    num: Int = 123;
    flag: Bool = false;

    init() {
        self.foo = 0;
        self.bar = true;
        self.baz = myAddress();
    }

    receive() {
        self.foo = 1;
    }
}