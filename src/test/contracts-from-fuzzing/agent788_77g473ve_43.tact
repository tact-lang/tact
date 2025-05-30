contract SetSomeLeaveOptional {
    flag1: Bool;
    flag2: Bool?;
    flag3: Bool;

    init() {
        self.flag1 = true;
        self.flag3 = false;
    }
}
