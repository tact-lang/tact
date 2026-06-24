contract InitDefaults {
    a: Int = 7;
    b: Bool = false;
    c: String = "hi";
    d: Address;

    init() {
        self.d = myAddress();
    }
}