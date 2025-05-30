contract TestContract {
    f1: Int = -42;
    f2: Bool = true;
    f3: Address;

    init() {
        self.f1 = 100;
        self.f2 = false;
        self.f3 = myAddress();
    }
}