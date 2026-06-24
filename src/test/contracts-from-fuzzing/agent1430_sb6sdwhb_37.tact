contract MixPersistent {
    count: Int;
    flag: Bool;
    note: String;

    init() {
        self.count = 42;
        self.flag = true;
        self.note = "mix";
    }
}
