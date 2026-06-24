contract Test2 {
    a: Int;
    b: Bool;
    c: Address;
    d: String;

    init() {
        self.a = 10;
        self.b = true;
        self.c = myAddress();
        self.d = "hello";
    }
}