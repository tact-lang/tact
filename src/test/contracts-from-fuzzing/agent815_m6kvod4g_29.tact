contract ScalarsOnly {
    a: Int;
    b: Bool;
    c: String;
    d: Address;

    init() {
        self.a = 0;
        self.b = true;
        self.c = "";
        self.d = myAddress();
    }
}