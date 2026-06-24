contract TestContract {
    a: Int = 1;
    b: Int as uint8 = 2;
    c: Int as int64 = 3;
    d: Bool = true;
    e: Bool = false;
    f: Address;

    init() {
        self.f = myAddress();
    }
}