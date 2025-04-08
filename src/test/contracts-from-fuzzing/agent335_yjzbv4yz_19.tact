contract DefaultsInFields {
    count: Int = 42;
    flag: Bool = true;

    init() {
        self.count = 100;
        self.flag = false;
    }
}
