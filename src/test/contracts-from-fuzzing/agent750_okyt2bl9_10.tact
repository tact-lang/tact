contract OptionalFieldsVsInit {
    num: Int?;
    flag: Bool?;

    init() {
        self.num = null;
        self.flag = true;
    }
}
