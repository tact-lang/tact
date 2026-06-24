contract MixedNulls {
    oi: Int?;
    ob: Bool?;
    oaddr: Address?;
    ocell: Cell?;

    init() {
        self.oi = 0;
        self.ob = null;
        self.oaddr = myAddress();
        self.ocell = null;
    }
}