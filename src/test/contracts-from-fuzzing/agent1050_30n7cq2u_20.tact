contract OptionalInits {
    num: Int?;
    flag: Bool?;
    msg: String?;

    init() {
        self.num = null;
        self.flag = null;
        self.msg = null;
    }
}