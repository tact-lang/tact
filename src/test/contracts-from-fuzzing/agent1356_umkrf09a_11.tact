contract EmptyDefaults {
    n: Int;
    b: Bool;
    s: String;
    a: Address;

    init() {
        self.n = 0;
        self.b = false;
        self.s = "";
        self.a = myAddress();
    }
}
