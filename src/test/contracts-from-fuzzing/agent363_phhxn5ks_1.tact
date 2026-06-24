contract TestContract {
    foo: Int = 1;
    bar: Bool = true;
    addr: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");

    init() {
        self.foo = 42;
        self.bar = false;
    }
    
    receive() {}
}