contract OptionalBasicTypes {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    oa: Address?;

    init() {
        self.oi = 42;
        self.ob = true;
        self.os = "str";
        self.oc = emptyCell();
        self.oa = myAddress();
    }
}