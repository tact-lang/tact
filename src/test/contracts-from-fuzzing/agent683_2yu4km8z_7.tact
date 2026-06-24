contract OptsAndDefaults {
    a: Int = 123;
    b: Int?;
    c: String = "hi";
    d: Bool = false;
    e: Address;

    init() {
        self.b = null;
        self.e = myAddress();
    }
}