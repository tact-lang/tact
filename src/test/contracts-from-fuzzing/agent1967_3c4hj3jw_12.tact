contract TestContract {
    foo: Int?; 

    init() {
        self.foo = null;
    }

    receive() {
        self.foo = 37;
    }
}