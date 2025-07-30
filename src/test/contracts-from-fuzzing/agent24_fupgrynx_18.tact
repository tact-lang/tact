contract AllOptionals {
    oa: Int?;
    ob: Bool?;
    oc: Address?;
    od: Cell?;
    oe: Slice?;
    of: String?;

    init() {
        self.oa = null;
        self.ob = null;
        self.oc = null;
        self.od = null;
        self.oe = null;
        self.of = null;
    }
}