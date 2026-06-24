contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    init() {
        self.a = 10;
        self.b = false;
        self.c = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    }
    receive() {}
}