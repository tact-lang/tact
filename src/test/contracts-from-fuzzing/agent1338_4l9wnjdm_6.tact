contract OptionalsPersist {
    number: Int?;
    flag: Bool?;
    message: String?;

    init() {
        self.number = null;
        self.flag = true;
        self.message = null;
    }
}