contract StrBoolIntOpt {
    name: String?;
    active: Bool;
    count: Int?;

    init() {
        self.name = null;
        self.active = true;
        self.count = 123;
    }
}