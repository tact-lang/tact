contract LargeManyFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Int = 4;
    e: String = "e";
    f: Bool = false;
    g: Int = 7;
    h: String = "h";
    i: Bool = true;
    j: String = "j";
    k: Int = 11;
    l: Bool = false;
    m: Int = 13;
    n: String = "n";
    o: Bool = true;
    p: Int = 16;
    q: String = "q";
    r: Bool = false;
    s: Int = 19;
    t: String = "t";

    init() {
        self.k = 100;
        self.n = "updated";
    }
}