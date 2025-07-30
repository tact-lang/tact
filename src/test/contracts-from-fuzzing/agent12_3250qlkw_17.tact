contract OptionalBoolIntInit {
    flag: Bool?;
    number: Int?;

    init() {
        self.flag = true;
        self.number = null;
    }
}