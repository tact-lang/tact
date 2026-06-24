contract BigDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Address;

    init() {
        self.d = myAddress();
    }
}