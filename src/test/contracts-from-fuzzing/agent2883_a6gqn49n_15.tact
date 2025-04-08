contract OptionalInitialized {
    count: Int?;
    note: String?;
    flag: Bool?;

    init() {
        self.count = 42;
        self.note = null;
        self.flag = true;
    }
}