// Many optional fields directly on contract
contract TestContract {
    oa: Int?;
    ob: Bool?;
    oc: Address?;
    od: Cell?;
    oe: String?;
    of: Slice?;

    init() {
        self.oa = null;
        self.ob = null;
        self.oc = null;
        self.od = null;
        self.oe = null;
        self.of = null;
    }
}