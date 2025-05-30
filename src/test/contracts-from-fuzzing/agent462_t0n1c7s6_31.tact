contract ChainOfPrimitives {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Address;
    e: Int = 2;
    f: Bool = false;
    g: String = "g";
    h: Address;
    i: Int = 3;
    j: Bool = true;
    k: String = "k";
    l: Address;
    m: Int = 4;
    n: Bool = false;
    o: String = "o";
    p: Address;

    init() {
        self.d = myAddress();
        self.h = myAddress();
        self.l = myAddress();
        self.p = myAddress();
    }
}