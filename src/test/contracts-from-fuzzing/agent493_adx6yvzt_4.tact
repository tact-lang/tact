contract Test {
    a: Int = 42;
    b: Bool = true;
    c: Address;

    init() {
        self.c = myAddress();
    }
}
