contract MixedOptionals {
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    os: Slice?;

    init() {
        self.oi = 123;
        self.ob = null;
        self.oa = myAddress();
        self.oc = null;
        self.os = emptyCell().asSlice();
    }
}