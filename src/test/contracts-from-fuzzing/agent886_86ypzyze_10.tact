contract TestContract {
    a: Int = 10;
    b: Bool = false;
    c: Address;

    init() {
        self.c = myAddress();
    }
}