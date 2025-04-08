contract SimpleEmptyDefaults {
    flag: Bool;
    message: String = "";

    init() {
        self.flag = false;
    }
}