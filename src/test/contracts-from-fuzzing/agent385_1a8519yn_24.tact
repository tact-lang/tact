contract OnlyOptionals {
    count: Int?;
    flag: Bool?;
    msg: String?;

    init() {
        self.count = null;
        self.flag = true;
        self.msg = null;
    }
}
