struct Info { val: Int; }

contract TestContract {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
    ni: Info?;

    init() {
        self.oi = 99;
        self.ob = null;
        self.os = "hi";
        self.oa = null;
        self.ni = Info{val:777};
    }
}