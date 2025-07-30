contract InitDefaults {
    x: Int = 1;
    y: Bool = true;
    s: String = "hello";
    a: Address;

    init() {
        self.a = myAddress();
    }
}