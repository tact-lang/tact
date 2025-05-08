contract ComplexDefaults {
    a: Int = 1;
    b: Bool? = null;
    c: String = "abc";
    d: Address;
    init() {
        self.d = myAddress();
    }
}
