contract InitNoDefaults {
    count: Int;
    flag: Bool;
    str: String;

    init() {
        self.count = 100;
        self.flag = true;
        self.str = "init";
    }
}