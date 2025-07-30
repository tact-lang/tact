contract Test {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = false;
    e: Address;

    init() {
        self.e = myAddress();
    }
}