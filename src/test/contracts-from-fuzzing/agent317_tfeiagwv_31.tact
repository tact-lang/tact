// Reordering optional and non optional fields
contract OrderMix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;

    init() {
        self.a = 0;
        self.b = null;
        self.c = false;
        self.d = null;
        self.e = "abc";
        self.f = null;
        self.g = myAddress();
        self.h = null;
    }
}