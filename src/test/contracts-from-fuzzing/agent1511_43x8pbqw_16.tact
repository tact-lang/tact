contract NoDefaultsRequired {
    count: Int;
    flag: Bool;
    note: String;

    init() {
        self.count = 7;
        self.flag = false;
        self.note = "note";
    }
}