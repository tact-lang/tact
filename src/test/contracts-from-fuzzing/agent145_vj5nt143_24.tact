contract OnlyOptionals {
    oa: Int?;
    ob: Bool?;
    oc: String?;
    od: Address?;

    init() {
        self.oa = null;
        self.ob = null;
        self.oc = null;
        self.od = null;
    }
}
