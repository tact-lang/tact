contract OptionalBool {
    flag: Bool?;

    init() {
        self.flag = false;
        self.flag = null;
        self.flag = true;
    }
}