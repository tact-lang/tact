contract ManyPrimitiveFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Address; // removed default
    e: Int = 2;
    f: Bool = false;
    g: String = "g";
    h: Address; // removed default
    i: Int = 3;
    j: Bool = true;
    k: String = "k";
    l: Address; // removed default
    m: Int = 4;
    n: Bool = false;
    o: String = "o";
    p: Address; // removed default

    init() {
        self.d = myAddress();
        self.h = myAddress();
        self.l = myAddress();
        self.p = myAddress();
    }
}