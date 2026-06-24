contract AllOptionals {
    oa: Int?;
    ob: Bool?;
    oc: Address?;
    od: Slice?;
    oe: String?;

    init() {
        self.oa = null;
        self.ob = null;
        self.oc = null;
        self.od = null;
        self.oe = null;
    }
}