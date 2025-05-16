contract TestContract {
    a: Int = 0;
    b: Bool? = null;
    c: String = "";
    d: Address;

    init() {
        self.d = myAddress();
    }
}
