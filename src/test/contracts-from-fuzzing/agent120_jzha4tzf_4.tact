contract WideContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "a";
    d: Address;
    e: Int = 2;
    f: Bool = false;
    g: String = "b";
    h: Address;
    i: Int = 3;
    j: Bool = true;
    k: String = "c";
    l: Address;
    m: Int = 4;
    n: Bool = false;
    o: String = "d";
    p: Address;
    q: Int = 5;
    r: Bool = true;
    s: String = "e";
    t: Address;

    init() {
        let dummy = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.d = dummy;
        self.h = dummy;
        self.l = dummy;
        self.p = dummy;
        self.t = dummy;
    }
}