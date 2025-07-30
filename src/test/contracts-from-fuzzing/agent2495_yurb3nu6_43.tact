contract WithManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int? = null;
    d: String = "";
    e: Address;

    init() {
        self.e = myAddress();
    }
}