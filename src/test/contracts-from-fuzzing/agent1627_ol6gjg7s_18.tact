contract StringAndOptional {
    name: String;
    nickname: String?;

    init() {
        self.name = "primary";
        self.nickname = null;
    }
}
