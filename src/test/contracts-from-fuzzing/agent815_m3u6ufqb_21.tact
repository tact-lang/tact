contract LargeMixedOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address;
    e: Int;
    f: Bool;
    g: String;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = myAddress();
        self.e = 1;
        self.f = false;
        self.g = "hello";
    }
}