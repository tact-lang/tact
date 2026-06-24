contract ScalarAndOptional {
    count: Int as uint32;
    flag: Bool;
    note: String?;
    init() {
        self.count = 77;
        self.flag = true;
        self.note = null;
    }
}