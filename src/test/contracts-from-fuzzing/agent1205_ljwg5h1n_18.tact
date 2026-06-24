contract InitDefaults {
    x: Int = 7;
    y: Bool = true;
    s: String = "abc";
    a: Address;

    init() {
        self.a = myAddress();
    }
}