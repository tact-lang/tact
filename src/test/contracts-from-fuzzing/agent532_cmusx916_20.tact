contract OptionalOverrides {
    data: Int? = null;
    flag: Bool? = true;

    init() {
        self.data = 123;
        self.flag = false;
    }
}