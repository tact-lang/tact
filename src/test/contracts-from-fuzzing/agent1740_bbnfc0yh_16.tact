contract BasicOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = myAddress();
        self.d = null;
    }
}