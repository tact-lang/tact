struct Sub {
    id: Int;
    ok: Bool;
}

contract ArrangedFields {
    a: Int;
    b: Bool;
    s: String;
    n: Int?;
    sub: Sub;
    o: Bool?;
    t: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.s = "yes";
        self.n = null;
        self.sub = Sub{ id:2, ok:false };
        self.o = false;
        self.t = null;
    }
}