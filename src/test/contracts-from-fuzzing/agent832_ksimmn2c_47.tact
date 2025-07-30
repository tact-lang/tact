contract OptionalBoolReset {
    flag: Bool? = null;

    init() {
        self.flag = true;
        self.flag = null;
    }
}