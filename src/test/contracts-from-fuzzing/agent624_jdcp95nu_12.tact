contract ManyOptionals {
    oa: Int? = null;
    ob: Bool? = null;
    oc: String? = null;
    od: Address? = null;
    oe: Cell? = null;
    of: Slice? = null;

    init() {
        self.oa = 1;
        self.ob = true;
        self.oc = "ok";
        self.od = null;
        self.oe = null;
        self.of = null;
    }
}