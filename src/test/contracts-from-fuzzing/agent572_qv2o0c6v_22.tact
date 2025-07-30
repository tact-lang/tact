contract LargeContractFields {
    // Mix of optional and non-optional fields of various types
    a: Int;
    b: Bool?;
    c: Address;
    d: Int?;
    e: Bool;
    f: String;
    g: Address?;
    h: Int;
    i: String?;
    j: Bool;
    init() {
        self.a = 1;
        self.b = null;
        self.c = myAddress();
        self.d = null;
        self.e = true;
        self.f = "this is f";
        self.g = null;
        self.h = 777;
        self.i = null;
        self.j = false;
    }
}