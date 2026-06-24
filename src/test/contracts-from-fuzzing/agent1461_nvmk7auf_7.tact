contract ManyOptionals {
    oa: Int?;
    ob: Bool?;
    oc: String?;
    od: Address?;
    oe: Cell?;
    of: Slice?;
    og: Int?;
    oh: Bool?;
    oi: String?;
    oj: Address?;
    ok: Cell?;
    ol: Slice?;

    init() {
        self.oa = null;
        self.ob = null;
        self.oc = null;
        self.od = null;
        self.oe = null;
        self.of = null;
        self.og = 123;
        self.oh = true;
        self.oi = "ok";
        self.oj = myAddress();
        self.ok = emptyCell();
        self.ol = emptyCell().asSlice();
    }
}