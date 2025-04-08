contract DefaultsInInit {
    a: Int;
    b: Bool;
    c: String = "hi";
    d: Address;
    e: Int? = null;
    init() {
        self.a = 123;
        self.b = true;
        self.d = myAddress();
        self.e = 42;
    }
    receive() {}
}