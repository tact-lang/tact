contract TestContract {
    a: Int = 7;
    b: Bool = true;
    c: Address;

    init() {
        self.c = myAddress();
    }
}
