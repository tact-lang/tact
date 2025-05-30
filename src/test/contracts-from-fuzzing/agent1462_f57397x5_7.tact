contract Optionals {
    a: Int?;
    b: Bool?;
    c: Address?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = myAddress();
    }
}