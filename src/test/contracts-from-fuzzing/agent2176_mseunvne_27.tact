contract OptionalInitNull {
    str: String?;
    flag: Bool?;
    num: Int?;

    init() {
        self.str = null;
        self.flag = null;
        self.num = null;
    }
}
