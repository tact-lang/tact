contract Test7 {
    a: Int = 1;
    b: Bool = false;
    c: Address;
    d: String;

    init() {
        self.c = myAddress();
        self.d = "abc";
    }
}