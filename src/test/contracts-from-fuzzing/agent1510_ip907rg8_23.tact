contract OnlyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Address;

    init() {
        self.d = myAddress();
    }
}