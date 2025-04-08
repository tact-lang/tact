contract OptionalFieldsTest {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;

    init() {
        self.oi = null;
        self.ob = true;
        self.os = null;
        self.oa = myAddress();
    }
}