contract TopLevelOptionalStructField {
    number: Int?;
    flag: Bool;
    note: String?;

    init() {
        self.number = null;
        self.flag = false;
        self.note = null;
    }
}