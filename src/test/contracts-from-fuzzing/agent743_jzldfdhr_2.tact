contract TestContract {
    x: Int = 42;
    y: Bool = true;
    s: String = "test";
    a: Address;

    init() {
        self.x = 1;
        self.y = false;
        self.s = "changed";
        self.a = myAddress();
    }
}