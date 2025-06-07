contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address;

    init() {
        self.a = 42;
        self.b = true;
        self.c = "test";
        self.d = myAddress();
    }
}