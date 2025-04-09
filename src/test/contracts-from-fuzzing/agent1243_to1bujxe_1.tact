contract Test {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "test";
        self.f4 = myAddress();
    }
}