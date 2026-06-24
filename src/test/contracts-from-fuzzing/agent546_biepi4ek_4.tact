contract OptionalFields {
    flag1: Bool?;
    flag2: Bool?;
    number: Int?;
    message: String?;

    init() {
        self.flag1 = true;
        self.flag2 = null;
        self.number = null;
        self.message = "present";
    }
}