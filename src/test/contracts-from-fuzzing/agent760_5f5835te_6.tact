contract ManyPrimitives2 {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
    g: Int = 7;
    h: Int = 8;
    i: Int = 9;
    j: Int = 10;
    k: Bool = true;
    l: Bool = false;
    m: String = "m";
    n: String = "n";
    o: String = "o";
    p: Address;
    q: Address;
    r: Bool = true;
    s: Int = 11;
    t: Int = 12;

    init() {
        self.a = 10;
        self.p = myAddress();
        self.q = myAddress();
    }
}