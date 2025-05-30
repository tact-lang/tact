contract MixInitVars {
    a: Int = 1;
    b: Bool;
    c: String = "hi";
    d: Address;

    init() {
        self.b = true;
        self.d = myAddress();
    }
}