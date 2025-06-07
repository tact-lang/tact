// Very long contract field list, with string and address mix
contract WideMix {
    a: String = "a";
    b: String = "b";
    c: String = "c";
    d: String = "d";
    e: String = "e";
    f: String = "f";
    g: String = "g";
    h: String = "h";
    i: String = "i";
    j: String = "j";
    k: Address;
    l: Address;
    m: Address;
    n: Address;
    o: String = "o";
    p: String = "p";
    q: String = "q";
    r: String = "r";
    s: String = "s";
    t: String = "t";

    init() {
        self.k = myAddress();
        self.l = myAddress();
        self.m = myAddress();
        self.n = myAddress();
    }
}
