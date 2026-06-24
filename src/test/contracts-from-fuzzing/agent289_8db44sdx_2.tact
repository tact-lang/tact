contract TestContract {
    a: Int;
    b: Bool;
    c: Address;

    init() {
        self.a = 42;
        self.b = true;
        self.c = myAddress();
    }

    receive() {}
}