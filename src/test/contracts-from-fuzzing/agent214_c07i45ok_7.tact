contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = null;
    e: Address;

    init() {
        self.e = myAddress();
    }
}