contract TestContract {
    a: Int = 1;
    b: Bool = false;
    c: Int? = null;
    d: Address;

    init() {
        self.d = myAddress();
    }
}