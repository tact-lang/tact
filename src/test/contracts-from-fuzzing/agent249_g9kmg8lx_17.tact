struct Dummy {
    ok: Bool;
    msg: String?;
}

contract LotsPersistent {
    a: Int = 0;
    b: Int = 1;
    c: Int = 2;
    d: Int = 3;
    e: Int = 4;
    f: Int = 5;
    g: Bool = true;
    h: Bool = false;
    i: Bool?;
    j: Int?;
    k: Bool?;
    l: Int?;
    m: Bool?;
    n: Int?;
    o: Bool?;
    p: Int?;
    q: Bool?;
    r: Int?;
    s: Bool?;
    t: Int?;
    nested: Dummy;

    init() {
        self.nested = Dummy{ ok: true, msg: "msg" };
    }

    receive() {
        let _ = self.q;
    }
}