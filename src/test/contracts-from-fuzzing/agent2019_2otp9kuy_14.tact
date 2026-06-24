// Many optional fields initialized as non-null
contract NonNullOptionals {
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    os: String?;

    init() {
        self.oi = 5;
        self.ob = true;
        self.oa = myAddress();
        self.os = "abc";
    }
}