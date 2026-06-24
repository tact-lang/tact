contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address;

    init() {
        self.c = myAddress();
    }
}