contract OnlyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Address;
    e: Int? = null;
    f: Bool? = null;
    g: String? = null;

    init() {
        self.d = myAddress();
    }
}