contract OptionalFieldsTest {
    valIntOpt: Int?;
    valBoolOpt: Bool?;
    valStrOpt: String?;

    init() {
        self.valIntOpt = null;
        self.valBoolOpt = true;
        self.valStrOpt = "hello";
    }
}
