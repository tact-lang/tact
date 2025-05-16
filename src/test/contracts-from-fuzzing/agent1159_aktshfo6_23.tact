contract TestContract {
    n: Int?;
    b: Bool;
    s: String;
    a: Address;

    init() {
        self.n = null;
        self.b = false;
        self.s = "";
        self.a = myAddress();
    }
}