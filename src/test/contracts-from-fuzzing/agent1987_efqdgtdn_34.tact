contract OptionalBoolString {
    flag: Bool?;
    note: String?;

    init() {
        self.flag = null;
        self.note = "foo";
    }
}