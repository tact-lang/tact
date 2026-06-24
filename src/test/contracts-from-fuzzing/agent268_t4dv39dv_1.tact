contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "fuzz";
        self.d = myAddress();
    }
}