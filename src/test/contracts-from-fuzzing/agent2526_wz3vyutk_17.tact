contract TestStorage {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;

    init() {
        self.a = 5;
        self.c = true;
        self.d = null;
        self.e = myAddress();
        self.f = null;
    }
}