struct LotOfOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Int?;
    k: Bool?;
    l: String?;
    m: Int?;
    n: Bool?;
    o: String?;
    p: Int?;
    q: Bool?;
    r: String?;
    s: Int?;
    t: Bool?;
    u: String?;
    v: Int?;
}

contract ManyOptionalsContract {
    bigOpt: LotOfOptionals = LotOfOptionals{};

    receive() {
        self.bigOpt = self.bigOpt;
    }
}