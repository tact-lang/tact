contract A {
    a: Int;
    b: Bool;
    c: Address;
    d: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "test";
    }
}