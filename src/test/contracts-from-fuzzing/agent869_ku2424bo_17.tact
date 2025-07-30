contract ManyOptionals {
    oa: Int?;
    ob: Bool?;
    oc: Int?;
    od: Bool?;
    oe: Address?;
    of: String?;

    init() {
        self.oa = null;
        self.ob = null;
        self.oc = null;
        self.od = null;
        self.oe = null;
        self.of = null;
    }

    receive() {}
}
